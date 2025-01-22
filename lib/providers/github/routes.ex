defmodule Apipe.Providers.GitHub.Routes do
  @moduledoc "OpenAPI generated route registry"
  @behaviour Apipe.Providers.OpenAPI.Routes
  @routes [
    %{
      method: :get,
      operation_id: "repos/get",
      path: "repos/{owner}/{repo}",
      response_schema: GitHubOpenAPI.FullRepository,
      summary: "Get a repository"
    },
    %{
      method: :get,
      operation_id: "repos/list-languages",
      path: "repos/{owner}/{repo}/languages",
      response_schema: GitHubOpenAPI.Language,
      summary: "List repository languages"
    },
    %{
      method: :get,
      operation_id: "users/get-by-username",
      path: "users/{username}",
      response_schema: GitHubOpenAPI.PublicUser,
      summary: "Get a user"
    },
    %{
      method: :get,
      operation_id: "repos/list-for-user",
      path: "users/{username}/repos",
      response_schema: GitHubOpenAPI.MinimalRepository,
      summary: "List repositories for a user"
    }
  ]
  (
    @impl true
    def match_route(path)

    def match_route("repos/" <> _rest = path) do
      route =
        Enum.find(
          @routes,
          &String.starts_with?(path, String.replace(&1.path, "{owner}/{repo}", ""))
        )

      if route do
        {:ok, route}
      else
        %Apipe.Error{type: :validation_error, message: "Route not found", details: %{path: path}}
      end
    end

    def match_route("users/" <> _rest = path) do
      route =
        Enum.find(@routes, &String.starts_with?(path, String.replace(&1.path, "{username}", "")))

      if route do
        {:ok, route}
      else
        %Apipe.Error{type: :validation_error, message: "Route not found", details: %{path: path}}
      end
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