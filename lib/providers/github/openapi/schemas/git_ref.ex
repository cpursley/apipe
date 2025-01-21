defmodule GitHubOpenAPI.GitRef do
  @moduledoc """
  Provides struct and type for a GitRef
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          node_id: String.t(),
          object: GitHubOpenAPI.GitRefObject.t(),
          ref: String.t(),
          url: String.t()
        }

  defstruct [:__info__, :__joins__, :node_id, :object, :ref, :url]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      node_id: {:string, :generic},
      object: {GitHubOpenAPI.GitRefObject, :t},
      ref: {:string, :generic},
      url: {:string, :uri}
    ]
  end
end
