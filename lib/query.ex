defmodule Apipe.Query do
  @moduledoc """
  Core query structure used across all adapters.

  This struct represents a query that can be executed by any provider,
  containing fields for filtering, sorting, pagination, and type casting.
  """

  @type transform :: (any() -> any())
  @type join :: %{
          field: atom(),
          query_fn: (any() -> t())
        }

  @type t :: %__MODULE__{
          provider: module(),
          provider_opts: keyword(),
          from: String.t(),
          cast_type: module() | nil,
          select: list(String.t()),
          filters: list(filter()),
          order_by: String.t() | nil,
          order_direction: :asc | :desc | nil,
          limit: pos_integer() | nil,
          offset: non_neg_integer() | nil,
          joins: list(join())
        }

  @type filter :: {:eq | :gt | :lt | :gte | :lte | :like | :in, String.t(), any()}

  @enforce_keys [:provider]
  defstruct provider: nil,
            provider_opts: [],
            from: nil,
            cast_type: nil,
            select: [],
            filters: [],
            order_by: nil,
            order_direction: nil,
            limit: nil,
            offset: nil,
            joins: []

  @doc """
  Validates the query structure before execution.

  Returns `{:ok, query}` if the query is valid, or `{:error, error}` if not.

  ## Examples

      iex> query = %Apipe.Query{provider: MyProvider, from: "users"}
      iex> Apipe.Query.validate(query)
      {:ok, query}

      iex> query = %Apipe.Query{provider: nil, from: "users"}
      iex> Apipe.Query.validate(query)
      {:error, %Apipe.Error{type: :invalid_query, message: "Provider is required"}}
  """
  def validate(%__MODULE__{} = query) do
    cond do
      is_nil(query.from) ->
        {:error, %Apipe.Error{type: :invalid_query, message: "FROM clause is required"}}

      is_nil(query.provider) ->
        {:error, %Apipe.Error{type: :invalid_query, message: "Provider is required"}}

      true ->
        {:ok, query}
    end
  end
end
