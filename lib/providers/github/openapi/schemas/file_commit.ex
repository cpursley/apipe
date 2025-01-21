defmodule GitHubOpenAPI.FileCommit do
  @moduledoc """
  Provides struct and type for a FileCommit
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          commit: GitHubOpenAPI.FileCommitCommit.t(),
          content: GitHubOpenAPI.FileCommitContent.t() | nil
        }

  defstruct [:__info__, :__joins__, :commit, :content]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      commit: {GitHubOpenAPI.FileCommitCommit, :t},
      content: {:union, [{GitHubOpenAPI.FileCommitContent, :t}, :null]}
    ]
  end
end
