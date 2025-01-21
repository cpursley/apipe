defmodule GitHubOpenAPI.GitCommit do
  @moduledoc """
  Provides struct and type for a GitCommit
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          author: GitHubOpenAPI.GitCommitAuthor.t(),
          committer: GitHubOpenAPI.GitCommitCommitter.t(),
          html_url: String.t(),
          message: String.t(),
          node_id: String.t(),
          parents: [GitHubOpenAPI.GitCommitParents.t()],
          sha: String.t(),
          tree: GitHubOpenAPI.GitCommitTree.t(),
          url: String.t(),
          verification: GitHubOpenAPI.GitCommitVerification.t()
        }

  defstruct [
    :__info__,
    :__joins__,
    :author,
    :committer,
    :html_url,
    :message,
    :node_id,
    :parents,
    :sha,
    :tree,
    :url,
    :verification
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      author: {GitHubOpenAPI.GitCommitAuthor, :t},
      committer: {GitHubOpenAPI.GitCommitCommitter, :t},
      html_url: {:string, :uri},
      message: {:string, :generic},
      node_id: {:string, :generic},
      parents: [{GitHubOpenAPI.GitCommitParents, :t}],
      sha: {:string, :generic},
      tree: {GitHubOpenAPI.GitCommitTree, :t},
      url: {:string, :uri},
      verification: {GitHubOpenAPI.GitCommitVerification, :t}
    ]
  end
end
