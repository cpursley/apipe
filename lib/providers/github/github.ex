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
  alias Apipe.PostProcess

  @supported_search_endpoints ~w(
    search/repositories
    search/users
    search/code
    search/issues
    search/commits
    search/topics
  )

  @impl true
  @doc """
  Executes a query against the GitHub API.

  ## Options

    * `:token` - GitHub personal access token for authentication

  ## Examples

      Apipe.new(Apipe.Providers.GitHub, token: "github_pat_...")
      |> Apipe.from("search/repositories")
      |> Apipe.execute()

      # Get repository details
      Apipe.new(Apipe.Providers.GitHub, token: "github_pat_...")
      |> Apipe.from("repos/elixir-lang/elixir")
      |> Apipe.execute()
  """
  def execute(query, opts \\ []) do
    with {:ok, query} <- validate_endpoint(query),
         {:ok, query} <- Apipe.Query.validate(query),
         {:ok, req} <- build_request(query, opts),
         {:ok, response} <- make_request(req, query) do
      response
      |> process_response(query)
      |> PostProcess.filter_fields(query)
      |> wrap_response(response, query, opts)
    end
  end

  defp validate_endpoint(%{from: from} = query) do
    cond do
      from in @supported_search_endpoints ->
        {:ok, query}
      String.match?(from, ~r/^repos\/[\w\-\.]+\/[\w\-\.]+$/) ->
        {:ok, query}
      true ->
        %Apipe.Error{
          type: :provider_error,
          message: "Unsupported endpoint",
          details: %{
            endpoint: from,
            supported_endpoints: @supported_search_endpoints ++ ["repos/{owner}/{repo}"]
          }
        }
    end
  end

  @doc false
  defp build_request(%{from: _from} = _query, opts) do
    headers = [{"accept", "application/vnd.github.v3+json"}]

    headers = case Keyword.get(opts, :token) do
      nil -> headers
      token -> [{"authorization", "Bearer #{token}"} | headers]
    end

    req = Req.new(
      base_url: "https://api.github.com",
      headers: headers
    )

    {:ok, req}
  end

  @doc false
  defp make_request(req, query) do
    params = if String.starts_with?(query.from, "search/") do
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
      String.starts_with?(from, "search/users") and field in ["bio", "location", "name", "email", "company"] ->
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

    # Handle search queries
    base_params = if String.starts_with?(query.from, "search/") do
      search_terms = build_search_query(query)
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
  def process_response(%{status: status} = response, _query) when status in 200..299 do
    {:ok, response.body}
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

  defp maybe_add_param(params, _key, nil), do: params
  defp maybe_add_param(params, key, value), do: Map.put(params, key, value)

  defp wrap_response({:ok, body}, response, query, opts) do
    response_data =
      if opts[:cast_response] do
        if String.starts_with?(query.from, "search/") do
          item_type = case String.split(query.from, "/") do
            ["search", "repositories" | _] -> Apipe.Providers.GitHub.Types.Repository
            ["search", "issues" | _] -> Apipe.Providers.GitHub.Types.Issue
            ["search", "users" | _] -> Apipe.Providers.GitHub.Types.User
            ["search", "topics" | _] -> Apipe.Providers.GitHub.Types.Topic
            _ ->
              %Apipe.Error{
                type: :provider_error,
                message: "Unsupported search endpoint type",
                details: %{endpoint: query.from}
              }
          end

          case item_type do
            %Apipe.Error{} = error -> error
            type ->
              {:ok, data} = Apipe.Providers.GitHub.Types.SearchResponse.cast(body, type)
              data
          end
        else
          # For non-search endpoints, cast directly to Repository
          {:ok, data} = Apipe.Providers.GitHub.Types.Repository.cast(body)
          data
        end
      else
        body
      end

    case response_data do
      %Apipe.Error{} = error -> error
      data ->
        %Apipe.Response{
          data: data,
          meta: %{
            rate_limit: %{
              limit: get_header_value(response, "x-ratelimit-limit"),
              remaining: get_header_value(response, "x-ratelimit-remaining"),
              reset: get_header_value(response, "x-ratelimit-reset"),
              used: get_header_value(response, "x-ratelimit-used")
            },
            pagination: case get_header_value(response, "link") do
              nil -> nil
              link_header -> parse_link_header(link_header)
            end
          }
        }
    end
  end
  defp wrap_response(error, _response, _query, _opts), do: error

  defp get_header_value(response, header) do
    value = case get_in(response.headers, [header]) do
      nil -> nil
      value when is_list(value) -> hd(value)
      value when is_binary(value) -> value
    end

    case value do
      nil -> nil
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
end
