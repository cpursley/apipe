defmodule Apipe.PostProcess do
  @moduledoc """
  Handles post-processing operations on API responses that can be used with any provider.
  These operations are applied after the provider returns data, and are useful when
  a provider doesn't support certain operations natively.
  """

  @doc """
  Filters fields from the response data based on the query's select clause.
  """
  def filter_fields({:ok, body}, %{select: [_ | _] = fields}) do
    filtered_data =
      case body do
        %{"items" => items} when is_list(items) ->
          %{body | "items" => Enum.map(items, &take_fields(&1, fields))}

        items when is_list(items) ->
          Enum.map(items, &take_fields(&1, fields))

        item when is_map(item) ->
          take_fields(item, fields)
      end

    {:ok, filtered_data}
  end

  def filter_fields(response, _query), do: response

  @doc """
  Casts the response data to the specified struct type if one is provided in the query.
  """
  def cast_response({:ok, body}, %{cast_type: module}) when not is_nil(module) do
    casted_data =
      case body do
        %{"items" => items} when is_list(items) ->
          %{body | "items" => Enum.map(items, &cast_with_module(&1, module))}

        items when is_list(items) ->
          Enum.map(items, &cast_with_module(&1, module))

        item when is_map(item) ->
          cast_with_module(item, module)
      end

    {:ok, casted_data}
  end

  def cast_response(response, _query), do: response

  # Private helpers

  defp take_fields(map, fields) when is_map(map) do
    Map.take(map, fields)
  end

  defp cast_with_module(data, module) do
    # Use changeset instead of cast for Ecto schemas
    case module.changeset(struct(module), data) do
      %{valid?: true} = changeset -> Ecto.Changeset.apply_changes(changeset)
      changeset -> {:error, changeset}
    end
  end
end
