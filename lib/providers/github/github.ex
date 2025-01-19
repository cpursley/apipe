# Temp, Providers will live in stand-alone libraries in the future
defmodule Apipe.Providers.GitHub do
  @moduledoc """
  GitHub API provider for Apipe.

  This provider implements the GitHub REST API v3 interface, allowing you to query
  GitHub resources using Apipe's SQL-like syntax.

  ## Rate Limiting

  GitHub API has rate limits that vary based on authentication:
  - Authenticated requests: 5,000 requests per hour
  - Unauthenticated requests: 60 requests per hour

  ## Authentication

  The GitHub provider supports authentication via a personal access token:

      Apipe.new(Apipe.Providers.GitHub, token: "github_pat_...")

  If no token is provided, requests will be made anonymously with lower rate limits.

  ## Examples

      # Search for Elixir repositories
      Apipe.new(Apipe.Providers.GitHub, token: "github_pat_...")
      |> Apipe.from("search/repositories")
      |> Apipe.select(["id", "name", "description"])
      |> Apipe.where("language", "elixir")
      |> Apipe.cast(Apipe.Providers.GitHub.Types.Repository)
      |> Apipe.order_by("stars", :desc)
      |> Apipe.limit(10)
      |> Apipe.execute()

  ## Common Endpoints

  - `search/repositories` - Search repositories
  - `search/issues` - Search issues and pull requests
  - `search/users` - Search users
  - `search/code` - Search code in repositories
  - `search/commits` - Search commits
  - `search/labels` - Search repository labels
  - `search/topics` - Search GitHub topics
  - `repos/{owner}/{repo}` - Get repository details
  - `repos/{owner}/{repo}/issues` - List repository issues
  """

  @behaviour Apipe.Provider

  require Logger
  alias Apipe.{PostProcess, Provider.Settings}

  @default_settings %Settings{
    max_concurrency: 3,
    join_strategy: :async,
    retry: :safe_transient
  }

  @supported_search_endpoints ~w(
    search/repositories
    search/users
    search/code
    search/issues
    search/commits
    search/topics
  )

  @doc false
  def should_retry?(_req, resp) do
    case resp do
      {:ok, %{status: status}} when status in [429, 500, 501, 502, 503, 504] -> true
      {:error, _} -> true
      _ -> false
    end
  end

  @impl true
  @doc """
  Executes a query against the GitHub API.

  ## Options

    * `:token` - GitHub personal access token for authentication
    * `:settings` - Override default settings for max_concurrency, retry behavior, etc.

  ## Examples

      Apipe.new(Apipe.Providers.GitHub, token: "github_pat_...")
      |> Apipe.from("search/repositories")
      |> Apipe.execute()

      # With custom settings
      Apipe.new(Apipe.Providers.GitHub,
        token: "github_pat_...",
        settings: %{max_concurrency: 5, retry: :safe_transient}
      )
      |> Apipe.from("repos/elixir-lang/elixir")
      |> Apipe.execute()
  """
  def execute(query, opts \\ []) do
    with {:ok, query} <- validate_endpoint(query),
         {:ok, query} <- Apipe.Query.validate(query) do
      settings = Map.merge(@default_settings, Keyword.get(opts, :settings, %{}))

      req =
        Req.new(
          base_url: "https://api.github.com",
          retry: &should_retry?/2,
          headers: build_headers(opts)
        )

      case make_request(req, query) do
        {:ok, response} ->
          response
          |> process_response(query)
          |> apply_transforms(query.transforms)
          |> apply_joins(query.joins, settings)
          |> case do
            {:ok, {data, meta}} when is_list(data) ->
              # Handle search results or list data with metadata
              filtered_data = PostProcess.filter_fields(data, query)
              wrap_response({:ok, {filtered_data, meta}}, response, query, opts)

            {:ok, {data, meta}} ->
              # Handle single item with metadata
              filtered_data = PostProcess.filter_fields(data, query)
              wrap_response({:ok, {filtered_data, meta}}, response, query, opts)

            {:ok, data} ->
              # Handle data without metadata
              filtered_data = PostProcess.filter_fields(data, query)
              wrap_response({:ok, filtered_data}, response, query, opts)

            error ->
              error
          end

        error ->
          error
      end
    end
  end

  defp build_headers(opts) do
    headers = [{"accept", "application/vnd.github.v3+json"}]

    case Keyword.get(opts, :token) do
      nil -> headers
      token -> [{"authorization", "Bearer #{token}"} | headers]
    end
  end

  defp validate_endpoint(%{from: from} = query) do
    cond do
      from in @supported_search_endpoints ->
        {:ok, query}

      String.match?(from, ~r/^repos\/[\w\-\.]+\/[\w\-\.]+$/) ->
        {:ok, query}

      String.match?(
        from,
        ~r/^repos\/[\w\-\.]+\/[\w\-\.]+\/(issues|pulls|releases|contributors|commits|branches|tags)$/
      ) ->
        {:ok, query}

      true ->
        %Apipe.Error{
          type: :provider_error,
          message: "Unsupported endpoint",
          details: %{
            endpoint: from,
            # Todo: don't do this here.
            supported_endpoints:
              @supported_search_endpoints ++
                [
                  "repos/{owner}/{repo}",
                  "repos/{owner}/{repo}/issues",
                  "repos/{owner}/{repo}/pulls",
                  "repos/{owner}/{repo}/releases",
                  "repos/{owner}/{repo}/contributors",
                  "repos/{owner}/{repo}/commits",
                  "repos/{owner}/{repo}/branches",
                  "repos/{owner}/{repo}/tags"
                ]
          }
        }
    end
  end

  defp make_request(req, query) do
    params =
      if String.starts_with?(query.from, "search/") do
        build_params(query)
      else
        %{per_page: query.limit}
      end

    url = query.from

    Logger.debug("""
    Making GitHub API request:
    URL: #{url}
    Params: #{inspect(params)}
    """)

    case Req.get(req, url: url, params: params) do
      {:ok, response} ->
        Logger.debug("""
        GitHub API response:
        Status: #{response.status}
        Headers: #{inspect(response.headers)}
        """)

        {:ok, response}

      {:error, error} ->
        Logger.error("GitHub API request failed: #{inspect(error)}")

        %Apipe.Error{
          type: :provider_error,
          message: "GitHub API request failed",
          details: %{
            error: error,
            request: %{
              url: url,
              params: params
            }
          }
        }
    end
  end

  @doc """
  Builds a GitHub search query string from the query filters.

  This function converts Apipe query filters into GitHub's search syntax.
  Special handling is provided for user searches and numeric comparisons.

  ## Examples

      iex> query = %Apipe.Query{
      ...>   from: "search/repositories",
      ...>   filters: [{:eq, "language", "elixir"}, {:gt, "stars", 100}]
      ...> }
      iex> Apipe.Providers.GitHub.build_search_query(query)
      "language:elixir stars:>100"

      iex> query = %Apipe.Query{
      ...>   from: "search/users",
      ...>   filters: [{:eq, "bio", "elixir"}]
      ...> }
      iex> Apipe.Providers.GitHub.build_search_query(query)
      "elixir in:bio"
  """
  def build_search_query(query) do
    filters = Enum.map(query.filters, &build_filter_expression(&1, query.from))
    Enum.join(filters, " ")
  end

  # Build a filter expression based on the operator and whether it's a user search
  defp build_filter_expression({operator, field, value}, from) do
    cond do
      String.starts_with?(from, "search/users") and
          field in ["bio", "location", "name", "email", "company"] ->
        "#{value} in:#{field}"

      String.starts_with?(from, "search/commits") and field == "author" ->
        "author:#{value}"

      String.starts_with?(from, "search/commits") and field == "committer" ->
        "committer:#{value}"

      String.starts_with?(from, "search/issues") and field == "is" ->
        "is:#{value}"

      String.starts_with?(from, "search/issues") and field == "label" ->
        "label:#{value}"

      String.starts_with?(from, "search/topics") and field == "name" ->
        # For topics, we just use the name directly without qualifiers
        case operator do
          :like -> String.trim(value, "%")
          :ilike -> String.trim(value, "%")
          _ -> value
        end

      String.starts_with?(from, "search/topics") and field == "featured" ->
        "is:featured"

      true ->
        case operator do
          :eq -> "#{field}:#{value}"
          :neq -> "-#{field}:#{value}"
          :gt -> "#{field}:>#{value}"
          :gte -> "#{field}:>=#{value}"
          :lt -> "#{field}:<#{value}"
          :lte -> "#{field}:<=#{value}"
          :in -> "#{field}:#{Enum.join(value, ",")}"
          :nin -> "-#{field}:#{Enum.join(value, ",")}"
          :like -> "#{field}:*#{String.trim(value, "%")}*"
          :ilike -> "#{field}:*#{String.trim(value, "%")}*"
          :nlike -> "-#{field}:*#{String.trim(value, "%")}*"
        end
    end
  end

  @doc """
  Builds the request parameters for a GitHub API request.

  This function converts an Apipe query into GitHub API parameters,
  handling search queries, pagination, and sorting.

  ## Examples

      iex> query = %Apipe.Query{
      ...>   from: "search/repositories",
      ...>   filters: [{:eq, "language", "elixir"}],
      ...>   limit: 10,
      ...>   order_by: "stars",
      ...>   order_direction: :desc
      ...> }
      iex> Apipe.Providers.GitHub.build_params(query)
      %{q: "language:elixir", per_page: 10, sort: "stars", order: :desc}
  """
  def build_params(query) do
    base_params = %{}

    # Build search query string for search endpoints
    base_params =
      if String.starts_with?(query.from, "search/") do
        search_terms = build_search_query(query)
        Logger.debug("Built search query: #{search_terms}")
        Map.put(base_params, :q, search_terms)
      else
        base_params
      end

    # Add pagination params
    base_params
    |> maybe_add_param(:per_page, query.limit)
    |> maybe_add_param(:page, if(query.offset, do: div(query.offset, query.limit || 30) + 1))
    |> maybe_add_param(:sort, query.order_by)
    |> maybe_add_param(:order, query.order_direction)
  end

  defp maybe_add_param(params, _key, nil), do: params
  defp maybe_add_param(params, key, value), do: Map.put(params, key, value)

  @doc """
  Processes a GitHub API response.

  This function handles both successful and error responses from the GitHub API,
  converting them into the appropriate Apipe response format.

  ## Examples

      iex> response = %{status: 200, body: %{"items" => []}}
      iex> query = %Apipe.Query{from: "search/repositories"}
      iex> Apipe.Providers.GitHub.process_response(response, query)
      {:ok, %{"items" => []}}

      iex> response = %{status: 422, body: %{"message" => "Validation Failed"}}
      iex> query = %Apipe.Query{from: "search/repositories"}
      iex> {:error, error} = Apipe.Providers.GitHub.process_response(response, query)
      iex> error.type
      :provider_error
  """
  def process_response(%{status: status} = response, query) when status in 200..299 do
    Logger.debug("Processing response body: #{inspect(response.body)}")

    case response.body do
      %{"items" => items} = body ->
        Logger.debug("Found items in response body")
        # Move search metadata to a separate map
        search_meta = %{
          total_count: body["total_count"],
          incomplete_results: body["incomplete_results"]
        }

        # Return items directly without wrapping
        {:ok, {items, search_meta}}

      items when is_list(items) ->
        Logger.debug("Response body is a list")
        # For search endpoints, add metadata
        if String.starts_with?(query.from, "search/") do
          {:ok, {items, %{total_count: length(items), incomplete_results: false}}}
        else
          {:ok, items}
        end

      item when is_map(item) ->
        Logger.debug("Response body is a single item")
        # For search endpoints, wrap single item in list with metadata
        if String.starts_with?(query.from, "search/") do
          {:ok, {[item], %{total_count: 1, incomplete_results: false}}}
        else
          {:ok, item}
        end
    end
  end

  def process_response(response, query) do
    %Apipe.Error{
      type: :provider_error,
      message: "GitHub API error",
      details: %{
        status: response.status,
        body: response.body,
        request: %{
          url: query.from,
          params: build_params(query)
        }
      }
    }
  end

  defp wrap_response({:ok, body}, response, query, opts) do
    {response_data, search_meta, join_rate_limits} =
      case body do
        # Handle filtered data with metadata
        {data, meta} when is_map(meta) ->
          {data, meta, []}

        # Handle data with join rate limits
        {data, join_rate_limits} when is_list(join_rate_limits) ->
          {data, nil, join_rate_limits}

        # Handle search results with join rate limits
        {items, meta, join_rate_limits} when is_list(join_rate_limits) ->
          {items, meta, join_rate_limits}

        # Handle non-search results without joins
        other ->
          {other, nil, []}
      end

    # Cast the response after joins have been processed
    response_data =
      if opts[:cast_response] do
        cond do
          String.starts_with?(query.from, "search/") ->
            item_type =
              case String.split(query.from, "/") do
                ["search", "repositories" | _] ->
                  Apipe.Providers.GitHub.Types.Repository

                ["search", "issues" | _] ->
                  Apipe.Providers.GitHub.Types.Issue

                ["search", "users" | _] ->
                  Apipe.Providers.GitHub.Types.User

                ["search", "topics" | _] ->
                  Apipe.Providers.GitHub.Types.Topic

                _ ->
                  %Apipe.Error{
                    type: :provider_error,
                    message: "Unsupported search endpoint type",
                    details: %{endpoint: query.from}
                  }
              end

            case item_type do
              %Apipe.Error{} = error ->
                error

              type ->
                # Cast items directly since we've already flattened the structure
                Enum.map(response_data, fn item ->
                  case item do
                    {_field, value} when is_list(value) ->
                      # Handle tuple format from earlier processing
                      Enum.map(value, fn v ->
                        {:ok, cast_item} = type.cast(v)
                        cast_item
                      end)

                    item when is_map(item) ->
                      # Preserve any joined data before casting
                      joined_data =
                        Map.take(item, [
                          :contributors,
                          :issues,
                          :pulls,
                          :releases,
                          :commits,
                          :branches,
                          :tags
                        ])

                      {:ok, cast_item} = type.cast(item)
                      # Merge back the joined data after casting
                      Map.merge(cast_item, joined_data)
                  end
                end)
            end

          String.match?(query.from, ~r/^repos\/[\w\-\.]+\/[\w\-\.]+\/issues$/) ->
            cast_response_data(response_data, Apipe.Providers.GitHub.Types.Issue)

          String.match?(query.from, ~r/^repos\/[\w\-\.]+\/[\w\-\.]+\/pulls$/) ->
            cast_response_data(response_data, Apipe.Providers.GitHub.Types.PullRequest)

          String.match?(query.from, ~r/^repos\/[\w\-\.]+\/[\w\-\.]+\/releases$/) ->
            cast_response_data(response_data, Apipe.Providers.GitHub.Types.Release)

          String.match?(query.from, ~r/^repos\/[\w\-\.]+\/[\w\-\.]+\/contributors$/) ->
            cast_response_data(response_data, Apipe.Providers.GitHub.Types.User)

          String.match?(query.from, ~r/^repos\/[\w\-\.]+\/[\w\-\.]+\/commits$/) ->
            cast_response_data(response_data, Apipe.Providers.GitHub.Types.Commit)

          String.match?(query.from, ~r/^repos\/[\w\-\.]+\/[\w\-\.]+\/branches$/) ->
            cast_response_data(response_data, Apipe.Providers.GitHub.Types.Branch)

          String.match?(query.from, ~r/^repos\/[\w\-\.]+\/[\w\-\.]+\/tags$/) ->
            cast_response_data(response_data, Apipe.Providers.GitHub.Types.Tag)

          String.match?(query.from, ~r/^repos\/[\w\-\.]+\/[\w\-\.]+$/) ->
            cast_response_data(response_data, Apipe.Providers.GitHub.Types.Repository)

          true ->
            response_data
        end
      else
        response_data
      end

    case response_data do
      %Apipe.Error{} = error ->
        error

      data ->
        # Get rate limit from main request
        main_rate_limit = %{
          limit: get_header_value(response, "x-ratelimit-limit"),
          remaining: get_header_value(response, "x-ratelimit-remaining"),
          reset: get_header_value(response, "x-ratelimit-reset"),
          used: get_header_value(response, "x-ratelimit-used")
        }

        # Aggregate rate limits from main request and all joins
        aggregated_rate_limit =
          [main_rate_limit | join_rate_limits]
          |> Enum.reduce(%{limit: 0, remaining: nil, used: 0, reset: nil}, fn limit, acc ->
            %{
              limit: (acc.limit || 0) + (limit[:limit] || 0),
              remaining: min_remaining(acc.remaining, limit[:remaining]),
              used: (acc.used || 0) + (limit[:used] || 0),
              # Use the latest reset time
              reset: limit[:reset] || acc.reset
            }
          end)

        meta = %{
          rate_limit: aggregated_rate_limit,
          pagination:
            case get_header_value(response, "link") do
              nil -> nil
              link_header -> parse_link_header(link_header)
            end
        }

        # Add search metadata if present
        meta =
          if search_meta do
            Map.merge(meta, search_meta)
          else
            meta
          end

        # For search endpoints, extract items from the data structure
        final_data =
          if String.starts_with?(query.from, "search/") do
            case data do
              # Handle tuple format
              {items, _meta} -> items
              # Handle list format
              items when is_list(items) -> items
              # Handle single item
              other -> [other]
            end
          else
            data
          end

        %Apipe.Response{
          data: final_data,
          meta: meta
        }
    end
  end

  # Helper function to cast response data consistently
  defp cast_response_data(data, type) do
    case data do
      items when is_list(items) ->
        Enum.map(items, fn item ->
          {:ok, cast_item} = type.cast(item)
          cast_item
        end)

      item when is_map(item) ->
        {:ok, cast_item} = type.cast(item)
        cast_item

      _ ->
        data
    end
  end

  defp get_header_value(response, header) do
    value =
      case get_in(response.headers, [header]) do
        nil -> nil
        value when is_list(value) -> hd(value)
        value when is_binary(value) -> value
      end

    case value do
      nil ->
        nil

      value ->
        if String.starts_with?(header, "x-ratelimit") do
          String.to_integer(value)
        else
          value
        end
    end
  end

  defp parse_link_header(link_header) when is_binary(link_header) do
    link_header
    |> String.split(",")
    |> Enum.map(&parse_link/1)
    |> Enum.into(%{})
  end

  defp parse_link(link) do
    [_, url, rel] = Regex.run(~r/<(.+)>;\s*rel="(.+)"/, link)
    {rel, url}
  end

  defp apply_transforms({:ok, data}, transforms) do
    case data do
      {items, meta} when is_list(items) ->
        transformed =
          Enum.reduce_while(transforms, {:ok, items}, fn transform, {:ok, acc} ->
            try do
              {:cont, {:ok, Enum.map(acc, transform)}}
            rescue
              e -> {:halt, {:error, e}}
            end
          end)

        case transformed do
          {:ok, items} -> {:ok, {items, meta}}
          error -> error
        end

      items when is_list(items) ->
        Enum.reduce_while(transforms, {:ok, items}, fn transform, {:ok, acc} ->
          try do
            transformed = Enum.map(acc, transform)
            {:cont, {:ok, transformed}}
          rescue
            e -> {:halt, {:error, e}}
          end
        end)

      _ ->
        {:ok, data}
    end
  end

  defp apply_joins({:ok, data}, joins, %{join_strategy: :async} = settings)
       when length(joins) > 0 do
    Logger.debug("Applying async joins: #{inspect(joins)}")
    Logger.debug("Data structure before joins: #{inspect(data)}")

    case data do
      %{"items" => items} = search_response ->
        Logger.debug("Processing search response items: #{inspect(items)}")

        {results, join_rate_limits} =
          Task.async_stream(
            items,
            &apply_joins_to_item(&1, joins),
            max_concurrency: settings.max_concurrency,
            ordered: true
          )
          |> Enum.map_reduce([], fn {:ok, {result, rate_limit}}, acc ->
            {result, [rate_limit | acc]}
          end)

        Logger.debug("Join results: #{inspect(results)}")
        {:ok, {Map.put(search_response, "items", results), join_rate_limits}}

      items when is_list(items) ->
        Logger.debug("Processing list items: #{inspect(items)}")

        {results, join_rate_limits} =
          Task.async_stream(
            items,
            &apply_joins_to_item(&1, joins),
            max_concurrency: settings.max_concurrency,
            ordered: true
          )
          |> Enum.map_reduce([], fn {:ok, {result, rate_limit}}, acc ->
            {result, [rate_limit | acc]}
          end)

        Logger.debug("Join results: #{inspect(results)}")
        {:ok, {results, join_rate_limits}}

      {items, _meta} when is_list(items) ->
        Logger.debug("Processing items with metadata: #{inspect(items)}")

        {results, join_rate_limits} =
          Task.async_stream(
            items,
            &apply_joins_to_item(&1, joins),
            max_concurrency: settings.max_concurrency,
            ordered: true
          )
          |> Enum.map_reduce([], fn {:ok, {result, rate_limit}}, acc ->
            {result, [rate_limit | acc]}
          end)

        Logger.debug("Join results: #{inspect(results)}")
        {:ok, {results, join_rate_limits}}

      _ ->
        Logger.debug("Data is not a list or search response: #{inspect(data)}")
        {:ok, {data, []}}
    end
  end

  defp apply_joins({:ok, data}, joins, _settings) when length(joins) > 0 do
    Logger.debug("Applying sync joins: #{inspect(joins)}")
    Logger.debug("Data structure before joins: #{inspect(data)}")

    case data do
      %{"items" => items} = search_response ->
        Logger.debug("Processing search response items: #{inspect(items)}")

        {results, join_rate_limits} =
          Enum.map_reduce(items, [], fn item, acc ->
            {result, rate_limit} = apply_joins_to_item(item, joins)
            {result, [rate_limit | acc]}
          end)

        Logger.debug("Join results: #{inspect(results)}")
        {:ok, {Map.put(search_response, "items", results), join_rate_limits}}

      items when is_list(items) ->
        Logger.debug("Processing list items: #{inspect(items)}")

        {results, join_rate_limits} =
          Enum.map_reduce(items, [], fn item, acc ->
            {result, rate_limit} = apply_joins_to_item(item, joins)
            {result, [rate_limit | acc]}
          end)

        Logger.debug("Join results: #{inspect(results)}")
        {:ok, {results, join_rate_limits}}

      {items, _meta} when is_list(items) ->
        Logger.debug("Processing items with metadata: #{inspect(items)}")

        {results, join_rate_limits} =
          Enum.map_reduce(items, [], fn item, acc ->
            {result, rate_limit} = apply_joins_to_item(item, joins)
            {result, [rate_limit | acc]}
          end)

        Logger.debug("Join results: #{inspect(results)}")
        {:ok, {results, join_rate_limits}}

      _ ->
        Logger.debug("Data is not a list or search response: #{inspect(data)}")
        {:ok, {data, []}}
    end
  end

  defp apply_joins(response, _, _), do: response

  defp apply_joins_to_item(item, joins) do
    Logger.debug("Applying joins to item: #{inspect(item)}")

    Enum.reduce(joins, {item, []}, fn join, {acc, rate_limits} ->
      Logger.debug("Executing join for field: #{inspect(join.field)} on item: #{inspect(item)}")

      case join.query_fn.(item) do
        %Apipe.Query{provider_opts: opts} = query ->
          Logger.debug("Join query: #{inspect(query)}")

          case execute(query, opts) do
            %Apipe.Response{data: joined_data, meta: %{rate_limit: rate_limit}} ->
              Logger.debug("Join response data: #{inspect(joined_data)}")
              # Preserve the joined data directly without additional casting
              {Map.put(acc, join.field, joined_data), [rate_limit | rate_limits]}

            error ->
              Logger.error("Join failed: #{inspect(error)}")
              {acc, rate_limits}
          end

        other ->
          Logger.debug("Join query (other): #{inspect(other)}")

          case execute(other) do
            %Apipe.Response{data: joined_data, meta: %{rate_limit: rate_limit}} ->
              Logger.debug("Join response data: #{inspect(joined_data)}")
              # Preserve the joined data directly without additional casting
              {Map.put(acc, join.field, joined_data), [rate_limit | rate_limits]}

            error ->
              Logger.error("Join failed: #{inspect(error)}")
              {acc, rate_limits}
          end
      end
    end)
  end

  # Helper to calculate minimum remaining rate limit, handling nil values
  defp min_remaining(nil, b), do: b
  defp min_remaining(a, nil), do: a
  defp min_remaining(a, b), do: min(a, b)
end
