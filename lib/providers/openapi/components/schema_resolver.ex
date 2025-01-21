defmodule Apipe.Providers.OpenAPI.Components.SchemaResolver do
  @moduledoc """
  Generates schema resolution logic for OpenAPI routes.
  """

  @doc """
  Generates the schema resolution logic for the given routes.

  Takes a map of routes from the OpenAPI specification and generates a function
  that maps route paths to their corresponding response schemas.

  ## Parameters

    * `routes` - Map of routes from the OpenAPI specification

  ## Returns

  Returns quoted code containing the `get_schema/1` function implementation.
  """
  def generate(routes) do
    quote do
      @impl true
      def get_schema(path) do
        case match_route(path) do
          {:ok, route} -> {:ok, route.response_schema}
          %Apipe.Error{} = error -> error
        end
      end
    end
  end
end
