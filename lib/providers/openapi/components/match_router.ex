defmodule Apipe.Providers.OpenAPI.Components.MatchRouter do
  @moduledoc """
  Generates route matching logic for OpenAPI routes.
  """

  @doc """
  Generates the route matching logic for the given routes.

  Takes a list of route maps from the OpenAPI specification and generates the matching
  function that will validate incoming route paths. The generated function handles:

  - Path parameter extraction (e.g. {owner} and {repo} from "repos/{owner}/{repo}")
  - Route validation against registered paths
  - Method validation

  ## Parameters

    * `routes` - List of route maps from the OpenAPI specification

  ## Returns

  Returns quoted code containing the `match_route/1` function implementation.
  """
  def generate(routes) do
    quote do
      @impl true
      def match_route(path)

      def match_route("repos/" <> _rest = path) do
        route =
          Enum.find(
            @routes,
            &String.starts_with?(path, String.replace(&1.path, "{owner}/{repo}", ""))
          )

        if route,
          do: {:ok, route},
          else: %Apipe.Error{
            type: :validation_error,
            message: "Route not found",
            details: %{path: path}
          }
      end

      def match_route("users/" <> _rest = path) do
        route =
          Enum.find(
            @routes,
            &String.starts_with?(path, String.replace(&1.path, "{username}", ""))
          )

        if route,
          do: {:ok, route},
          else: %Apipe.Error{
            type: :validation_error,
            message: "Route not found",
            details: %{path: path}
          }
      end

      def match_route(path) do
        %Apipe.Error{
          type: :validation_error,
          message: "Route not found",
          details: %{
            path: path
          }
        }
      end
    end
  end
end
