# Temp, Providers will live in stand-alone libraries in the future
defmodule Apipe.Providers.GitHub do
  @moduledoc """
  GitHub API provider for Apipe.

  This provider implements the GitHub REST API v3 interface, allowing you to query
  GitHub resources using Apipe's SQL-like syntax.

  ## OpenAPI Config Source (last updated 2025-01-22): https://raw.githubusercontent.com/github/rest-api-description/main/descriptions/api.github.com/api.github.com.yaml

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
  alias Apipe.{PostProcess, Providers.Settings}

  # Make the routes module optional at compile time
  @compile {:no_warn_undefined, Apipe.Providers.GitHub.Routes}

  alias Apipe.Providers.GitHub.Routes

  @default_settings %Settings{
    max_concurrency: 3,
    join_strategy: :async,
    retry: :safe_transient
  }

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
    with {:ok, query} <- Apipe.Query.validate(query),
         {:ok, _route} <- Routes.match_route(query.from),
         {:ok, schema} <- Routes.get_schema(query.from) do
      settings = Map.merge(@default_settings, Keyword.get(opts, :settings, %{}))

      # Allow test_response to bypass HTTP call
      response =
        case Keyword.get(opts, :test_response) do
          nil ->
            req =
              Req.new(
                base_url: "https://api.github.com",
                retry: &should_retry?/2,
                headers: build_headers(opts)
              )

            make_request(req, query)

          test_response ->
            {:ok, test_response}
        end

      case response do
        {:ok, response} ->
          response
          |> process_response(query)
          |> Apipe.apply_joins(query.joins, settings)
          |> case do
            {:ok, {data, meta}} when is_list(data) ->
              # Handle search results or list data with metadata
              filtered_data = PostProcess.filter_fields(data, query)

              wrap_response(
                {:ok, {filtered_data, meta}},
                response,
                query,
                Map.new(opts) |> Map.put(:schema, schema) |> Map.put(:cast_response, true)
              )

            {:ok, {data, meta}} ->
              # Handle single item with metadata
              filtered_data = PostProcess.filter_fields(data, query)

              wrap_response(
                {:ok, {filtered_data, meta}},
                response,
                query,
                Map.new(opts) |> Map.put(:schema, schema) |> Map.put(:cast_response, true)
              )

            {:ok, data} ->
              # Handle data without metadata
              filtered_data = PostProcess.filter_fields(data, query)

              wrap_response(
                {:ok, filtered_data},
                response,
                query,
                Map.new(opts) |> Map.put(:schema, schema) |> Map.put(:cast_response, true)
              )

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
    query.filters
    |> Enum.map(&build_filter_expression(&1, query.from))
    |> Enum.join(" ")
  end

  # Build a filter expression based on the operator and whether it's a user search
  defp build_filter_expression({_operator, field, value}, "search/users/" <> _rest)
       when field in ["bio", "location", "name", "email", "company"] do
    "#{value} in:#{field}"
  end

  defp build_filter_expression({_operator, "author", value}, "search/commits/" <> _rest) do
    "author:#{value}"
  end

  defp build_filter_expression({_operator, "committer", value}, "search/commits/" <> _rest) do
    "committer:#{value}"
  end

  defp build_filter_expression({_operator, "is", value}, "search/issues/" <> _rest) do
    "is:#{value}"
  end

  defp build_filter_expression({_operator, "label", value}, "search/issues/" <> _rest) do
    "label:#{value}"
  end

  defp build_filter_expression({operator, "name", value}, "search/topics/" <> _rest) do
    case operator do
      :like -> String.trim(value, "%")
      :ilike -> String.trim(value, "%")
      _ -> value
    end
  end

  defp build_filter_expression({_operator, "featured", _value}, "search/topics/" <> _rest) do
    "is:featured"
  end

  defp build_filter_expression({operator, field, value}, _from) do
    build_filter_operator(operator, field, value)
  end

  defp build_filter_operator(:eq, field, value), do: "#{field}:#{value}"
  defp build_filter_operator(:neq, field, value), do: "-#{field}:#{value}"
  defp build_filter_operator(:gt, field, value), do: "#{field}:>#{value}"
  defp build_filter_operator(:gte, field, value), do: "#{field}:>=#{value}"
  defp build_filter_operator(:lt, field, value), do: "#{field}:<#{value}"
  defp build_filter_operator(:lte, field, value), do: "#{field}:<=#{value}"
  defp build_filter_operator(:in, field, value), do: "#{field}:#{Enum.join(value, ",")}"
  defp build_filter_operator(:nin, field, value), do: "-#{field}:#{Enum.join(value, ",")}"
  defp build_filter_operator(:like, field, value), do: "#{field}:*#{String.trim(value, "%")}*"
  defp build_filter_operator(:ilike, field, value), do: "#{field}:*#{String.trim(value, "%")}*"
  defp build_filter_operator(:nlike, field, value), do: "-#{field}:*#{String.trim(value, "%")}*"

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
        Map.put(%{}, :q, search_terms)
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

  defp get_header_value(response, header) do
    with {:ok, value} <- get_raw_header(response, header),
         {:ok, parsed_value} <- parse_header_value(value, header) do
      parsed_value
    else
      _ -> nil
    end
  end

  defp get_raw_header(response, header) do
    case get_in(response.headers, [header]) do
      nil -> {:error, :not_found}
      value when is_list(value) -> {:ok, hd(value)}
      value when is_binary(value) -> {:ok, value}
    end
  end

  defp parse_header_value(value, header) do
    if String.starts_with?(header, "x-ratelimit") do
      {:ok, String.to_integer(value)}
    else
      {:ok, value}
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

  defp extract_rate_limit(response) do
    with headers when not is_nil(headers) <- response.headers,
         rate_limit_data = %{
           "limit" => get_header_value(response, "x-ratelimit-limit"),
           "remaining" => get_header_value(response, "x-ratelimit-remaining"),
           "reset" => get_header_value(response, "x-ratelimit-reset"),
           "used" => get_header_value(response, "x-ratelimit-used")
         },
         changeset =
           GitHubOpenAPI.RateLimit.changeset(struct(GitHubOpenAPI.RateLimit), rate_limit_data),
         true <- changeset.valid? do
      {:ok, Ecto.Changeset.apply_changes(changeset)}
    else
      nil -> {:error, :no_headers}
      false -> {:error, :invalid_rate_limit}
      {:error, reason} -> {:error, {:cast_failed, reason}}
    end
  end

  defp build_response_meta(response) do
    case response do
      %{headers: _headers} = resp ->
        rate_limit =
          case extract_rate_limit(resp) do
            {:ok, rate_limit} -> rate_limit
            {:error, _reason} -> nil
          end

        pagination =
          case get_header_value(resp, "link") do
            nil -> nil
            link_header -> parse_link_header(link_header)
          end

        [rate_limit: rate_limit, pagination: pagination]
        |> Enum.reject(fn {_k, v} -> is_nil(v) or v == %{} end)
        |> Map.new()

      _ ->
        %{}
    end
  end

  defp cast_item(item, schema) do
    # Get any existing joins data
    joined_data = Map.get(item, "__joins__", [])

    # Apply the changeset
    case apply_changeset(schema, item) do
      {:ok, cast_item} ->
        # Merge any join data into the struct fields
        Enum.reduce(joined_data, cast_item, fn join_map, acc ->
          # Get the first (and only) key-value pair from the join map
          {field, data} = Enum.at(Map.to_list(join_map), 0)
          Map.put(acc, field, data)
        end)

      # Fallback to original item if casting fails
      {:error, changeset} ->
        item
    end
  end

  defp apply_changeset(schema, attrs) do
    case schema.changeset(struct(schema), attrs) do
      %{valid?: true} = changeset -> {:ok, Ecto.Changeset.apply_changes(changeset)}
      changeset -> {:error, changeset}
    end
  end

  defp cast_data(data, schema) when is_list(data) do
    Enum.map(data, &cast_item(&1, schema))
  end

  defp cast_data(data, schema) when is_map(data) do
    cast_item(data, schema)
  end

  defp wrap_response({:ok, body}, response, _query, opts) do
    {data, meta} =
      case body do
        {data, meta} when is_map(meta) ->
          {data, meta}

        {data, join_rate_limits} when is_list(join_rate_limits) ->
          {data, %{rate_limits: join_rate_limits}}

        other ->
          {other, %{}}
      end

    # Cast the response after joins have been processed
    cast_data =
      if Map.get(opts, :cast_response, true) do
        cast_data(data, opts[:schema])
      else
        data
      end

    # Build and merge metadata
    response_meta = build_response_meta(response)
    final_meta = Map.merge(meta, response_meta)

    %Apipe.Response{
      data: cast_data,
      meta: final_meta
    }
  end
end
