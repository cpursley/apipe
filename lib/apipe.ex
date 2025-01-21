defmodule Apipe do
  @moduledoc """
  Apipe provides a SQL-like interface for querying APIs.

  ## Examples

      alias Apipe.Providers.GitHub

      # Create a new GitHub client with casting enabled
      github = Apipe.new(GitHub, cast_response: true)

      # Query with type casting and field-operator syntax
      github
      |> Apipe.from("search/repositories")
      |> Apipe.where(:language, eq: "elixir")
      |> Apipe.gt(:stars, 1000)
      |> Apipe.order_by(:stars, :desc)
      |> Apipe.limit(10)
      |> Apipe.execute()

      # Query with field selection and map-based filters
      github
      |> Apipe.from("search/repositories")
      |> Apipe.select([:id, :name, :stargazers_count])
      |> Apipe.where(%{
        language: "elixir",
        stars: [gt: 1000, lte: 10000],
        name: [like: "phoenix"]
      })
      |> Apipe.execute()
  """

  alias Apipe.Query
  require Logger

  @doc """
  Creates a new query with the given provider and options.

  ## Options

    * `:token` - Provider-specific authentication token
    * `:cast_response` - Whether to cast responses to structs (default: false)

  ## Examples

      # Without casting (raw JSON responses)
      github = Apipe.new(GitHub)

      # With casting (typed responses)
      github = Apipe.new(GitHub, cast_response: true)

      # With authentication
      github = Apipe.new(GitHub, token: "github_pat_...", cast_response: true)
  """
  def new(provider, opts \\ []) do
    %Query{
      provider: provider,
      provider_opts: opts
    }
  end

  @doc """
  Sets the from path for the query.

  ## Examples

      github
      |> Apipe.from("search/repositories")
  """
  def from(query, path) when is_binary(path) do
    Logger.debug("Setting from path: #{path}")
    Logger.debug("Query before from: #{inspect(query)}")
    result = %{query | from: path}
    Logger.debug("Query after from: #{inspect(result)}")
    result
  end

  @doc """
  Specifies which fields to select from the response.

  Fields can be specified as:
  - A single field (atom or string): `select(:name)` or `select("name")`
  - A list of fields (atoms or strings): `select([:id, :name])` or `select(["id", "name"])`

  All fields will be normalized to strings internally.

  ## Examples

      iex> query = Apipe.new(Apipe.Providers.GitHub)
      iex> query = Apipe.select(query, :name)
      iex> %Apipe.Query{provider: Apipe.Providers.GitHub, select: ["name"]} = query

      iex> query = Apipe.new(Apipe.Providers.GitHub)
      iex> query = Apipe.select(query, [:id, "name", :description])
      iex> %Apipe.Query{provider: Apipe.Providers.GitHub, select: ["id", "name", "description"]} = query
  """
  def select(%Query{} = query, field) when is_atom(field) or is_binary(field) do
    Logger.debug("Setting select field: #{inspect(field)}")
    select(query, [field])
  end

  def select(%Query{} = query, fields) when is_list(fields) do
    normalized_fields = Enum.map(fields, &to_string/1)
    Logger.debug("Setting select fields: #{inspect(normalized_fields)}")
    Logger.debug("Query before select: #{inspect(query)}")
    result = struct!(Query, Map.from_struct(query) |> Map.put(:select, normalized_fields))
    Logger.debug("Query after select: #{inspect(result)}")
    result
  end

  @doc """
  Adds filters to the query using one of two syntaxes:

  1. Field-operator syntax:
     ```elixir
     where(:language, eq: "elixir")
     where(:stars, gt: 1000)
     ```

  2. Map-based syntax with support for multiple conditions:
     ```elixir
     where(%{language: "elixir"})  # Simple equality
     where(%{stars: [gt: 1000]})   # With operator
     where(%{                      # Multiple fields and operators
       language: "elixir",
       stars: [gt: 1000, lte: 10000],
       name: [like: "phoenix"]
     })
     ```

  Both syntaxes can be mixed and chained together.

  ## Examples

      # Field-operator syntax
      iex> query = Apipe.new(Apipe.Providers.GitHub)
      iex> query = Apipe.where(query, :language, eq: "elixir")
      iex> %Apipe.Query{provider: Apipe.Providers.GitHub, filters: [{:eq, "language", "elixir"}]} = query

      # Map syntax with multiple conditions
      iex> query = Apipe.new(Apipe.Providers.GitHub)
      iex> query = Apipe.where(query, %{stars: [gt: 100, lte: 1000]})
      iex> %Apipe.Query{provider: Apipe.Providers.GitHub, filters: [{:lte, "stars", 1000}, {:gt, "stars", 100}]} = query
  """
  def where(%Query{} = query, field, [{operator, value}])
      when is_atom(field) or is_binary(field) do
    field = to_string(field)
    %{query | filters: [{operator, field, value} | query.filters]}
  end

  def where(%Query{} = query, field, value) when is_atom(field) or is_binary(field) do
    field = to_string(field)
    %{query | filters: [{:eq, field, value} | query.filters]}
  end

  def where(%Query{} = query, conditions) when is_map(conditions) do
    Logger.debug("Adding where filters: #{inspect(conditions)}")
    Logger.debug("Query before where: #{inspect(query)}")

    filters = Enum.reduce(conditions, [], &process_condition/2)
    # Reverse the accumulated filters before adding them to preserve order
    result = Enum.reduce(Enum.reverse(filters), query, &add_filter(&2, &1))

    Logger.debug("Query after where: #{inspect(result)}")
    result
  end

  # Process a single field condition, which can be either a simple value or a list of operators
  defp process_condition({field, value}, acc) do
    field = to_string(field)

    case value do
      value when is_list(value) and is_tuple(hd(value)) ->
        # Handle operator list: [gt: 100, lt: 1000]
        Enum.reduce(value, acc, fn {op, val}, inner_acc ->
          [{op, field, val} | inner_acc]
        end)

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

  The field can be specified as either an atom or string.
  Direction defaults to `:asc` if not specified.

  ## Examples

      iex> query = Apipe.new(Apipe.Providers.GitHub)
      iex> query = Apipe.order_by(query, :stars, :desc)
      iex> %Apipe.Query{provider: Apipe.Providers.GitHub, order_by: "stars", order_direction: :desc} = query

      # Direction defaults to :asc
      iex> query = Apipe.new(Apipe.Providers.GitHub)
      iex> query = Apipe.order_by(query, "created_at")
      iex> %Apipe.Query{provider: Apipe.Providers.GitHub, order_by: "created_at", order_direction: :asc} = query
  """
  def order_by(%Query{} = query, field, direction \\ :asc)
      when direction in [:asc, :desc] do
    Logger.debug("Setting order by: field=#{field}, direction=#{direction}")
    Logger.debug("Query before order_by: #{inspect(query)}")

    result =
      struct!(
        Query,
        Map.from_struct(query)
        |> Map.merge(%{order_by: to_string(field), order_direction: direction})
      )

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

  @doc """
  Adds a transformation function to be applied to the response data.

  The transform function receives the response data and should return the transformed data.
  Transforms are applied in order, after the initial response is received but before joins.

  ## Examples

      iex> query = Apipe.new(Apipe.Providers.GitHub)
      iex> query = Apipe.transform(query, fn repo -> Map.update(repo, "stars", 0, &String.to_integer/1) end)
      iex> %Apipe.Query{transforms: [_]} = query
  """
  def transform(%Query{} = query, transform_fn) when is_function(transform_fn, 1) do
    Logger.debug("Adding transform function")
    %Query{query | transforms: query.transforms ++ [transform_fn]}
  end

  @doc """
  Adds a join operation to fetch related data.

  The join function receives a query function that will be called for each item in the result set.
  The query function should return a new Apipe query that will be executed to fetch the related data.

  The joined data will be stored in the `__joins__` field of the response structs.

  ## Options
    * `:max_concurrency` - Maximum number of concurrent requests (defaults to provider setting)
    * `:join_strategy` - Either `:async` or `:sync` (defaults to provider setting)

  ## Examples

      iex> query = Apipe.new(Apipe.Providers.GitHub)
      iex> join_fn = fn repo ->
      ...>   Apipe.new(Apipe.Providers.GitHub)
      ...>   |> Apipe.from("repos/\#{repo.full_name}/issues")
      ...>   |> Apipe.where(%{state: "open"})
      ...> end
      iex> query = Apipe.join(query, :issues, join_fn)
      iex> %Apipe.Query{joins: [%{field: :issues}]} = query
  """
  def join(%Query{} = query, field, query_fn, _opts \\ [])
      when is_atom(field) or (is_binary(field) and is_function(query_fn, 1)) do
    Logger.debug("Adding join on field: #{field}")

    join_spec = %{
      field: field,
      query_fn: query_fn
    }

    %Query{query | joins: query.joins ++ [join_spec]}
  end

  @doc """
  Applies join operations to the query results.

  This function processes the joins defined in the query and executes them against each item
  in the result set. The joined data is stored in the `__joins__` field of each item.

  ## Parameters
    * `response` - The initial response tuple from the query execution
    * `joins` - List of join specifications to apply
    * `settings` - Settings map containing join configuration:
      * `:join_strategy` - Either `:async` or `:sync`
      * `:max_concurrency` - Maximum number of concurrent requests for async joins

  ## Returns
    * `{:ok, data}` - The data with joins applied
    * Original response if no joins to apply

  ## Examples

      iex> response = {:ok, [%{id: 1, name: "repo"}]}
      iex> joins = [%{field: :issues, query_fn: fn _ -> Apipe.new(GitHub) end}]
      iex> settings = %{join_strategy: :sync}
      iex> {:ok, [%{id: 1, name: "repo", __joins__: %{issues: []}}]} = Apipe.apply_joins(response, joins, settings)
  """
  def apply_joins({:ok, data}, joins, %{join_strategy: :async} = settings)
      when length(joins) > 0 do
    Logger.debug("Applying async joins: #{inspect(joins)}")

    case data do
      items when is_list(items) ->
        {results, _} =
          Task.async_stream(
            items,
            &apply_joins_to_item(&1, joins),
            max_concurrency: settings.max_concurrency,
            ordered: true
          )
          |> Enum.map_reduce([], fn {:ok, result}, acc -> {result, acc} end)

        {:ok, results}

      {items, meta} when is_list(items) ->
        {results, _} =
          Task.async_stream(
            items,
            &apply_joins_to_item(&1, joins),
            max_concurrency: settings.max_concurrency,
            ordered: true
          )
          |> Enum.map_reduce([], fn {:ok, result}, acc -> {result, acc} end)

        {:ok, {results, meta}}

      item when is_map(item) ->
        {:ok, apply_joins_to_item(item, joins)}
    end
  end

  def apply_joins({:ok, data}, joins, _settings) when length(joins) > 0 do
    Logger.debug("Applying sync joins: #{inspect(joins)}")

    case data do
      items when is_list(items) ->
        results = Enum.map(items, &apply_joins_to_item(&1, joins))
        {:ok, results}

      {items, meta} when is_list(items) ->
        results = Enum.map(items, &apply_joins_to_item(&1, joins))
        {:ok, {results, meta}}

      item when is_map(item) ->
        {:ok, apply_joins_to_item(item, joins)}
    end
  end

  def apply_joins(response, _, _), do: response

  defp apply_joins_to_item(item, joins) do
    Logger.debug("Applying joins to item: #{inspect(item)}")

    joined_data =
      Enum.reduce(joins, [], fn join, acc ->
        Logger.debug("Executing join for field: #{inspect(join.field)} on item: #{inspect(item)}")

        case join.query_fn.(item) do
          %Query{provider_opts: opts} = query ->
            case execute(query, opts) do
              %{data: joined_data} ->
                # Create a map with the join field as the key
                join_map = Map.put(%{}, join.field, joined_data)
                acc ++ [join_map]

              _ ->
                acc
            end

          query ->
            case execute(query) do
              %{data: joined_data} ->
                # Create a map with the join field as the key
                join_map = Map.put(%{}, join.field, joined_data)
                acc ++ [join_map]

              _ ->
                acc
            end
        end
      end)

    # Store joined data in __joins__ field and merge into the struct
    if is_struct(item) do
      item = Map.put(item, :__joins__, joined_data)

      # Merge join data into the struct fields
      Enum.reduce(joined_data, item, fn join_map, acc ->
        # Get the first (and only) key-value pair
        {field, data} = Enum.at(join_map, 0)
        Map.put(acc, field, data)
      end)
    else
      item = Map.put(item, "__joins__", joined_data)

      # Merge join data into the map fields
      Enum.reduce(joined_data, item, fn join_map, acc ->
        # Get the first (and only) key-value pair
        {field, data} = Enum.at(join_map, 0)
        Map.put(acc, Atom.to_string(field), data)
      end)
    end
  end
end
