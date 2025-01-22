defmodule GitHubOpenAPI.CommitCommit do
  @moduledoc """
  Provides struct and type for a CommitCommit
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          author: GitHubOpenAPI.NullableGitUser.t(),
          comment_count: integer,
          committer: GitHubOpenAPI.NullableGitUser.t(),
          message: String.t(),
          tree: GitHubOpenAPI.CommitCommitTree.t(),
          url: String.t(),
          verification: GitHubOpenAPI.Verification.t() | nil
        }

  defstruct [
    :__info__,
    :__joins__,
    :author,
    :comment_count,
    :committer,
    :message,
    :tree,
    :url,
    :verification
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      author: {GitHubOpenAPI.NullableGitUser, :t},
      comment_count: :integer,
      committer: {GitHubOpenAPI.NullableGitUser, :t},
      message: {:string, :generic},
      tree: {GitHubOpenAPI.CommitCommitTree, :t},
      url: {:string, :uri},
      verification: {GitHubOpenAPI.Verification, :t}
    ]
  end
end
