defmodule Apipe.Providers.OpenAPI.Encoder do
  @moduledoc """
  Provides JSON encoding behavior for OpenAPI schemas generated by OpenAPI Generator (https://github.com/aj-foster/open-api-generator).
  """

  defmacro __using__(_opts) do
    quote do
      @derive {Jason.Encoder, except: [:__info__, :__joins__]}

      @doc """
      Casts a map to a struct.
      """
      def cast(data) when is_map(data) do
        # Get the list of fields defined in the struct
        fields = __MODULE__.__struct__() |> Map.keys() |> MapSet.new()

        # Extract any join data and ensure it's in the right format
        joins =
          case Map.get(data, "__joins__", []) do
            joins when is_list(joins) ->
              # Convert any string keys to atoms in the join maps
              Enum.map(joins, fn join_map ->
                Enum.reduce(join_map, %{}, fn {key, value}, acc ->
                  atom_key = if is_binary(key), do: String.to_atom(key), else: key
                  Map.put(acc, atom_key, value)
                end)
              end)

            _ ->
              []
          end

        # Only convert keys that exist in the struct
        atomized_data =
          data
          |> Enum.filter(fn {key, _} ->
            String.to_atom(key) in fields
          end)
          |> Enum.map(fn {k, v} -> {String.to_atom(k), v} end)
          |> Map.new()
          |> Map.put(:__info__, %{})
          |> Map.put(:__joins__, joins)

        # Merge any join data into the struct fields
        merged_data =
          Enum.reduce(joins, atomized_data, fn join_map, acc ->
            # Get the first (and only) key-value pair
            {field, data} = Enum.at(join_map, 0)
            Map.put(acc, field, data)
          end)

        result = struct(__MODULE__, merged_data)
        {:ok, result}
      end
    end
  end
end
