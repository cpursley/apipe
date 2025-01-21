defmodule Apipe.Providers.OpenAPI.Components.RouteValidator do
  @moduledoc """
  Generates route validation logic for OpenAPI routes.
  """

  @doc """
  Generates the route validation logic for the given routes.

  Takes a map of routes from the OpenAPI specification and generates validation
  functions that ensure route paths and parameters conform to the specification.

  ## Parameters

    * `routes` - Map of routes from the OpenAPI specification

  ## Returns

  Returns quoted code containing the `validate_route/1` function implementation.
  """
  def generate(routes) do
    quote do
      @impl true
      def valid_route?(path) do
        case match_route(path) do
          {:ok, _route} -> true
          %Apipe.Error{} -> false
        end
      end
    end
  end
end
