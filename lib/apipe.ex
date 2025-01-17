defmodule Apipe do
  @moduledoc """
  Apipe provides a SQL-like interface for querying APIs.

  ## Examples

      alias Apipe.Providers.GitHub

      # Create a new GitHub client
      github = Apipe.new(GitHub)

      # Query with type casting
      {:ok, response} =
        github
        |> Apipe.from("search/repositories")
        |> Apipe.where("language", "elixir")
        |> Apipe.order_by("stars", :desc)
        |> Apipe.limit(10)
        |> Apipe.cast(GitHub.Types.Repository)
        |> Apipe.execute()

      # Query without type casting
      {:ok, response} =
        github
        |> Apipe.from("search/repositories")
        |> Apipe.where("language", "elixir")
        |> Apipe.select(["id", "name", "stargazers_count"])
        |> Apipe.execute()
  """

  alias Apipe.Query
  require Logger

  @doc """
  Creates a new query for the specified provider.

  ## Examples

      iex> query = Apipe.new(Apipe.Providers.GitHub, token: "github_pat_...")
      iex> %Apipe.Query{provider: Apipe.Providers.GitHub, provider_opts: [token: "github_pat_..."]} = query
      iex> query
      %Apipe.Query{provider: Apipe.Providers.GitHub, provider_opts: [token: "github_pat_..."]}
  """
  def new(provider, opts \\ []) do
    Logger.debug("Creating new query: provider=#{inspect(provider)}, opts=#{inspect(opts)}")
    query = struct!(Query, provider: provider, provider_opts: opts)
    Logger.debug("Created query struct: #{inspect(query)}")
    query
  end

  @doc """
  Specifies the resource path to query.

  ## Examples

      iex> query = Apipe.new(Apipe.Providers.GitHub)
      iex> query = Apipe.from(query, "search/repositories")
      iex> %Apipe.Query{provider: Apipe.Providers.GitHub, from: "search/repositories"} = query
      iex> query
      %Apipe.Query{provider: Apipe.Providers.GitHub, from: "search/repositories"}
  """
  def from(%Query{} = query, path) when is_binary(path) do
    Logger.debug("Setting from path: #{path}")
    Logger.debug("Query before from: #{inspect(query)}")
    result = struct!(Query, Map.from_struct(query) |> Map.put(:from, path))
    Logger.debug("Query after from: #{inspect(result)}")
    result
  end

  @doc """
  Specifies which fields to select from the response.

  ## Examples

      iex> query = Apipe.new(Apipe.Providers.GitHub)
      iex> query = Apipe.select(query, ["id", "name", "description"])
      iex> %Apipe.Query{provider: Apipe.Providers.GitHub, select: ["id", "name", "description"]} = query
      iex> query
      %Apipe.Query{provider: Apipe.Providers.GitHub, select: ["id", "name", "description"]}
  """
  def select(%Query{} = query, fields) when is_list(fields) do
    Logger.debug("Setting select fields: #{inspect(fields)}")
    Logger.debug("Query before select: #{inspect(query)}")
    result = struct!(Query, Map.from_struct(query) |> Map.put(:select, fields))
    Logger.debug("Query after select: #{inspect(result)}")
    result
  end

  @doc """
  Adds filters to the query using a map of conditions.

  ## Examples

      iex> query = Apipe.new(Apipe.Providers.GitHub)
      iex> query = Apipe.where(query, %{language: "elixir"})
      iex> %Apipe.Query{provider: Apipe.Providers.GitHub, filters: [{:eq, "language", "elixir"}]} = query

      iex> query = Apipe.new(Apipe.Providers.GitHub)
      iex> query = Apipe.where(query, %{stars: [gt: 100]})
      iex> %Apipe.Query{provider: Apipe.Providers.GitHub, filters: [{:gt, "stars", 100}]} = query

      iex> query = Apipe.new(Apipe.Providers.GitHub)
      iex> query = Apipe.where(query, %{language: [in: ["elixir", "erlang"]]})
      iex> %Apipe.Query{provider: Apipe.Providers.GitHub, filters: [{:in, "language", ["elixir", "erlang"]}]} = query

      iex> query = Apipe.new(Apipe.Providers.GitHub)
      iex> query = Apipe.where(query, %{stars: [gte: 100, lte: 1000]})
      iex> %Apipe.Query{provider: Apipe.Providers.GitHub, filters: [{:lte, "stars", 1000}, {:gte, "stars", 100}]} = query
  """
  def where(%Query{} = query, conditions) when is_map(conditions) do
    Logger.debug("Adding where filters: #{inspect(conditions)}")
    Logger.debug("Query before where: #{inspect(query)}")

    filters = Enum.reduce(conditions, [], &process_condition/2)
    result = Enum.reduce(filters, query, &add_filter(&2, &1))

    Logger.debug("Query after where: #{inspect(result)}")
    result
  end

  # Process a single field condition, which can be either a simple value or a list of operators
  defp process_condition({field, value}, acc) do
    field = to_string(field)
    case value do
      value when is_list(value) and is_tuple(hd(value)) ->
        # Handle operator list: [gt: 100, lt: 1000]
        Enum.map(value, fn {op, val} -> {op, field, val} end) ++ acc
      value ->
        # Handle simple equality: "elixir"
        [{:eq, field, value} | acc]
    end
  end

  # Add a single filter to the query
  defp add_filter(%Query{} = query, {operator, field, value}) do
    filters = [{operator, field, value} | query.filters]
    %Query{query | filters: filters}
  end

  @doc """
  Specifies the field and direction to order results by.

  ## Examples

      iex> query = Apipe.new(Apipe.Providers.GitHub)
      iex> query = Apipe.order_by(query, "stars", :desc)
      iex> %Apipe.Query{provider: Apipe.Providers.GitHub, order_by: "stars", order_direction: :desc} = query
      iex> query
      %Apipe.Query{provider: Apipe.Providers.GitHub, order_by: "stars", order_direction: :desc}
  """
  def order_by(%Query{} = query, field, direction \\ :asc)
      when direction in [:asc, :desc] do
    Logger.debug("Setting order by: field=#{field}, direction=#{direction}")
    Logger.debug("Query before order_by: #{inspect(query)}")
    result = struct!(Query, Map.from_struct(query) |> Map.merge(%{order_by: field, order_direction: direction}))
    Logger.debug("Query after order_by: #{inspect(result)}")
    result
  end

  @doc """
  Limits the number of results returned.

  ## Examples

      iex> query = Apipe.new(Apipe.Providers.GitHub)
      iex> query = Apipe.limit(query, 10)
      iex> %Apipe.Query{provider: Apipe.Providers.GitHub, limit: 10} = query
      iex> query
      %Apipe.Query{provider: Apipe.Providers.GitHub, limit: 10}
  """
  def limit(%Query{} = query, limit) when is_integer(limit) and limit > 0 do
    Logger.debug("Setting limit: #{limit}")
    Logger.debug("Query before limit: #{inspect(query)}")
    result = struct!(Query, Map.from_struct(query) |> Map.put(:limit, limit))
    Logger.debug("Query after limit: #{inspect(result)}")
    result
  end

  @doc """
  Specifies the number of results to skip.

  ## Examples

      iex> query = Apipe.new(Apipe.Providers.GitHub)
      iex> query = Apipe.offset(query, 20)
      iex> %Apipe.Query{provider: Apipe.Providers.GitHub, offset: 20} = query
      iex> query
      %Apipe.Query{provider: Apipe.Providers.GitHub, offset: 20}
  """
  def offset(%Query{} = query, offset) when is_integer(offset) and offset >= 0 do
    Logger.debug("Setting offset: #{offset}")
    Logger.debug("Query before offset: #{inspect(query)}")
    result = struct!(Query, Map.from_struct(query) |> Map.put(:offset, offset))
    Logger.debug("Query after offset: #{inspect(result)}")
    result
  end

  @doc """
  Specifies a module to cast the response data into.

  The module must implement a `cast/1` function that accepts raw data and returns
  `{:ok, struct}` or `{:error, reason}`.

  ## Examples

      iex> query = Apipe.new(Apipe.Providers.GitHub)
      iex> query = Apipe.cast(query, Apipe.Providers.GitHub.Types.Repository)
      iex> %Apipe.Query{provider: Apipe.Providers.GitHub, cast_type: Apipe.Providers.GitHub.Types.Repository} = query
      iex> query
      %Apipe.Query{provider: Apipe.Providers.GitHub, cast_type: Apipe.Providers.GitHub.Types.Repository}
  """
  def cast(%Query{} = query, module) when is_atom(module) do
    Logger.debug("Setting cast type: #{inspect(module)}")
    Logger.debug("Query before cast: #{inspect(query)}")
    result = struct!(Query, Map.from_struct(query) |> Map.put(:cast_type, module))
    Logger.debug("Query after cast: #{inspect(result)}")
    result
  end

  @doc """
  Executes the query using the configured provider.

  ## Options

  Provider-specific options can be passed as the second argument.

  ## Examples

      iex> query = Apipe.new(Apipe.Providers.GitHub)
      iex> Apipe.from(query, "search/repositories")
      %Apipe.Query{provider: Apipe.Providers.GitHub, from: "search/repositories"}
  """
  def execute(%Query{} = query, opts \\ []) do
    Logger.debug("Executing query: #{inspect(query)}")
    query.provider.execute(query, Keyword.merge(query.provider_opts, opts))
  end

  @doc """
  Adds an equality filter to the query.

  ## Examples

      iex> query = Apipe.new(Apipe.Providers.GitHub)
      iex> query = Apipe.eq(query, "language", "elixir")
      iex> %Apipe.Query{provider: Apipe.Providers.GitHub, filters: [{:eq, "language", "elixir"}]} = query
  """
  def eq(%Query{} = query, field, value) do
    Logger.debug("Adding eq filter: field=#{field}, value=#{inspect(value)}")
    add_filter(query, {:eq, field, value})
  end

  @doc """
  Adds a not equal filter to the query.

  ## Examples

      iex> query = Apipe.new(Apipe.Providers.GitHub)
      iex> query = Apipe.neq(query, "language", "python")
      iex> %Apipe.Query{provider: Apipe.Providers.GitHub, filters: [{:neq, "language", "python"}]} = query
  """
  def neq(%Query{} = query, field, value) do
    Logger.debug("Adding neq filter: field=#{field}, value=#{inspect(value)}")
    add_filter(query, {:neq, field, value})
  end

  @doc """
  Adds a greater than filter to the query.

  ## Examples

      iex> query = Apipe.new(Apipe.Providers.GitHub)
      iex> query = Apipe.gt(query, "stars", 100)
      iex> %Apipe.Query{provider: Apipe.Providers.GitHub, filters: [{:gt, "stars", 100}]} = query
  """
  def gt(%Query{} = query, field, value) do
    Logger.debug("Adding gt filter: field=#{field}, value=#{inspect(value)}")
    add_filter(query, {:gt, field, value})
  end

  @doc """
  Adds a greater than or equal filter to the query.

  ## Examples

      iex> query = Apipe.new(Apipe.Providers.GitHub)
      iex> query = Apipe.gte(query, "stars", 100)
      iex> %Apipe.Query{provider: Apipe.Providers.GitHub, filters: [{:gte, "stars", 100}]} = query
  """
  def gte(%Query{} = query, field, value) do
    Logger.debug("Adding gte filter: field=#{field}, value=#{inspect(value)}")
    add_filter(query, {:gte, field, value})
  end

  @doc """
  Adds a less than filter to the query.

  ## Examples

      iex> query = Apipe.new(Apipe.Providers.GitHub)
      iex> query = Apipe.lt(query, "stars", 1000)
      iex> %Apipe.Query{provider: Apipe.Providers.GitHub, filters: [{:lt, "stars", 1000}]} = query
  """
  def lt(%Query{} = query, field, value) do
    Logger.debug("Adding lt filter: field=#{field}, value=#{inspect(value)}")
    add_filter(query, {:lt, field, value})
  end

  @doc """
  Adds a less than or equal filter to the query.

  ## Examples

      iex> query = Apipe.new(Apipe.Providers.GitHub)
      iex> query = Apipe.lte(query, "stars", 1000)
      iex> %Apipe.Query{provider: Apipe.Providers.GitHub, filters: [{:lte, "stars", 1000}]} = query
  """
  def lte(%Query{} = query, field, value) do
    Logger.debug("Adding lte filter: field=#{field}, value=#{inspect(value)}")
    add_filter(query, {:lte, field, value})
  end

  @doc """
  Adds a LIKE filter to the query.

  ## Examples

      iex> query = Apipe.new(Apipe.Providers.GitHub)
      iex> query = Apipe.like(query, "name", "%phoenix%")
      iex> %Apipe.Query{provider: Apipe.Providers.GitHub, filters: [{:like, "name", "%phoenix%"}]} = query
  """
  def like(%Query{} = query, field, value) do
    Logger.debug("Adding like filter: field=#{field}, value=#{inspect(value)}")
    add_filter(query, {:like, field, value})
  end

  @doc """
  Adds a case-insensitive LIKE filter to the query.

  ## Examples

      iex> query = Apipe.new(Apipe.Providers.GitHub)
      iex> query = Apipe.ilike(query, "name", "%phoenix%")
      iex> %Apipe.Query{provider: Apipe.Providers.GitHub, filters: [{:ilike, "name", "%phoenix%"}]} = query
  """
  def ilike(%Query{} = query, field, value) do
    Logger.debug("Adding ilike filter: field=#{field}, value=#{inspect(value)}")
    add_filter(query, {:ilike, field, value})
  end

  @doc """
  Adds an IN filter to the query.

  ## Examples

      iex> query = Apipe.new(Apipe.Providers.GitHub)
      iex> query = Apipe.in_list(query, "language", ["elixir", "erlang"])
      iex> %Apipe.Query{provider: Apipe.Providers.GitHub, filters: [{:in, "language", ["elixir", "erlang"]}]} = query
  """
  def in_list(%Query{} = query, field, values) when is_list(values) do
    Logger.debug("Adding in filter: field=#{field}, values=#{inspect(values)}")
    add_filter(query, {:in, field, values})
  end

  @doc """
  Adds a NOT IN filter to the query.

  ## Examples

      iex> query = Apipe.new(Apipe.Providers.GitHub)
      iex> query = Apipe.nin_list(query, "language", ["java", "python"])
      iex> %Apipe.Query{provider: Apipe.Providers.GitHub, filters: [{:nin, "language", ["java", "python"]}]} = query
  """
  def nin_list(%Query{} = query, field, values) when is_list(values) do
    Logger.debug("Adding nin filter: field=#{field}, values=#{inspect(values)}")
    add_filter(query, {:nin, field, values})
  end
end
