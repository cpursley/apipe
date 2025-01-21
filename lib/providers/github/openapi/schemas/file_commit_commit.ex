defmodule GitHubOpenAPI.FileCommitCommit do
  @moduledoc """
  Provides struct and type for a FileCommitCommit
  """
  use Apipe.Providers.OpenAPIEncoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          author: GitHubOpenAPI.FileCommitCommitAuthor.t() | nil,
          committer: GitHubOpenAPI.FileCommitCommitCommitter.t() | nil,
          html_url: String.t() | nil,
          message: String.t() | nil,
          node_id: String.t() | nil,
          parents: [GitHubOpenAPI.FileCommitCommitParents.t()] | nil,
          sha: String.t() | nil,
          tree: GitHubOpenAPI.FileCommitCommitTree.t() | nil,
          url: String.t() | nil,
          verification: GitHubOpenAPI.FileCommitCommitVerification.t() | nil
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
      author: {GitHubOpenAPI.FileCommitCommitAuthor, :t},
      committer: {GitHubOpenAPI.FileCommitCommitCommitter, :t},
      html_url: {:string, :generic},
      message: {:string, :generic},
      node_id: {:string, :generic},
      parents: [{GitHubOpenAPI.FileCommitCommitParents, :t}],
      sha: {:string, :generic},
      tree: {GitHubOpenAPI.FileCommitCommitTree, :t},
      url: {:string, :generic},
      verification: {GitHubOpenAPI.FileCommitCommitVerification, :t}
    ]
  end
end
