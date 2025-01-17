defmodule Apipe do
  @moduledoc """
  Main interface for building and executing queries across different providers.

  This module provides a SQL-like interface for querying various APIs in a
  consistent way, regardless of the underlying provider.
  """

  alias Apipe.Query
  require Logger

  @doc """
  Creates a new query for the specified provider.

  ## Options

  Provider-specific options can be passed as the second argument.

  ## Examples

      iex> Apipe.new(Apipe.Providers.GitHub, token: "github_pat_...")
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

      iex> Apipe.new(Apipe.Providers.GitHub)
      ...> |> Apipe.from("search/repositories")
      %Apipe.Query{from: "search/repositories"}
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

      iex> Apipe.new(Apipe.Providers.GitHub)
      ...> |> Apipe.select(["id", "name", "description"])
      %Apipe.Query{select: ["id", "name", "description"]}
  """
  def select(%Query{} = query, fields) when is_list(fields) do
    Logger.debug("Setting select fields: #{inspect(fields)}")
    Logger.debug("Query before select: #{inspect(query)}")
    result = struct!(Query, Map.from_struct(query) |> Map.put(:select, fields))
    Logger.debug("Query after select: #{inspect(result)}")
    result
  end

  @doc """
  Adds an equality filter to the query.

  ## Examples

      iex> Apipe.new(Apipe.Providers.GitHub)
      ...> |> Apipe.where("language", "elixir")
      %Apipe.Query{filters: [{:eq, "language", "elixir"}]}
  """
  def where(%Query{} = query, field, value) do
    Logger.debug("Adding where filter: field=#{field}, value=#{inspect(value)}")
    Logger.debug("Query before where: #{inspect(query)}")
    result = add_filter(query, {:eq, field, value})
    Logger.debug("Query after where: #{inspect(result)}")
    result
  end

  @doc """
  Specifies the field and direction to order results by.

  ## Examples

      iex> Apipe.new(Apipe.Providers.GitHub)
      ...> |> Apipe.order_by("stars", :desc)
      %Apipe.Query{order_by: "stars", order_direction: :desc}
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

      iex> Apipe.new(Apipe.Providers.GitHub)
      ...> |> Apipe.limit(10)
      %Apipe.Query{limit: 10}
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

      iex> Apipe.new(Apipe.Providers.GitHub)
      ...> |> Apipe.offset(20)
      %Apipe.Query{offset: 20}
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

      iex> Apipe.new(Apipe.Providers.GitHub)
      ...> |> Apipe.cast(Apipe.Providers.GitHub.Types.Repository)
      %Apipe.Query{cast_type: Apipe.Providers.GitHub.Types.Repository}
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

      iex> Apipe.new(Apipe.Providers.GitHub)
      ...> |> Apipe.from("search/repositories")
      ...> |> Apipe.execute()
      {:ok, results}
  """
  def execute(%Query{} = query, opts \\ []) do
    Logger.debug("Executing query: #{inspect(query)}")
    query.provider.execute(query, Keyword.merge(query.provider_opts, opts))
  end

  defp add_filter(%Query{} = query, filter) do
    struct!(Query, Map.from_struct(query) |> Map.update(:filters, [filter], &[filter | &1]))
  end
end
