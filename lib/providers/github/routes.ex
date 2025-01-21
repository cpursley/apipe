defmodule Apipe.Providers.GitHub.Routes do
  @moduledoc "OpenAPI generated route registry"
  @behaviour Apipe.Providers.OpenAPI.Routes
  @routes %{
    "repos/{owner}/{repo}" => %{
      method: :get,
      operation_id: "repos/get",
      response_schema: GitHubOpenAPI.FullRepository,
      summary: "Get a repository"
    }
  }
  (
    @impl true
    def match_route(path)

    def match_route("repos/" <> _rest) do
      {:ok, @routes["repos/{owner}/{repo}"]}
    end

    def match_route(path) do
      %Apipe.Error{type: :validation_error, message: "Route not found", details: %{path: path}}
    end
  )

  (
    @impl true
    def get_schema(path) do
      case match_route(path) do
        {:ok, route} -> {:ok, route.response_schema}
        %Apipe.Error{} = error -> error
      end
    end
  )

  (
    @impl true
    def valid_route?(path) do
      case match_route(path) do
        {:ok, _route} -> true
        %Apipe.Error{} -> false
      end
    end
  )

  defmacro __before_compile__(_env) do
    quote do
    end
  end

  def match_route(path) do
    %Apipe.Error{type: :validation_error, message: "Route not found", details: %{path: path}}
  end
end