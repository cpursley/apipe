defmodule GitHubOpenAPI.GitTree do
  @moduledoc """
  Provides struct and types for a GitTree
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          sha: String.t(),
          tree: [GitHubOpenAPI.GitTreeTree.t()],
          truncated: boolean,
          url: String.t()
        }

  defstruct [:__info__, :__joins__, :sha, :tree, :truncated, :url]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      sha: {:string, :generic},
      tree: [{GitHubOpenAPI.GitTreeTree, :t}],
      truncated: :boolean,
      url: {:string, :uri}
    ]
  end
end
