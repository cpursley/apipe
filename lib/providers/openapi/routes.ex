defmodule Apipe.Providers.OpenAPI.Routes do
  @moduledoc """
  Behaviour for OpenAPI route modules.

  This behaviour defines the interface that all OpenAPI route modules must implement.
  It includes functions for route matching, schema resolution, and validation.
  """

  @doc """
  Matches a path to a registered route.

  Returns `{:ok, route}` if the path matches a registered route,
  or an `Apipe.Error` with type `:validation_error` if no match is found.
  """
  @callback match_route(path :: String.t()) ::
              {:ok, map()} | %Apipe.Error{}

  @doc """
  Gets the response schema for a given path.

  Returns `{:ok, module}` with the schema module if found,
  or an `Apipe.Error` with type `:validation_error` if no schema is found.
  """
  @callback get_schema(path :: String.t()) ::
              {:ok, module()} | %Apipe.Error{}

  @doc """
  Checks if a path matches a registered route.

  Returns `true` if the path is valid, `false` otherwise.
  """
  @callback valid_route?(path :: String.t()) :: boolean()

  @optional_callbacks [valid_route?: 1]
end
