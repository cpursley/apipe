defmodule GitHubOpenAPI.NullableSimpleCommit do
  @moduledoc """
  Provides struct and type for a NullableSimpleCommit
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          author: GitHubOpenAPI.NullableSimpleCommitAuthor.t() | nil,
          committer: GitHubOpenAPI.NullableSimpleCommitCommitter.t() | nil,
          id: String.t(),
          message: String.t(),
          timestamp: DateTime.t(),
          tree_id: String.t()
        }

  defstruct [:__info__, :__joins__, :author, :committer, :id, :message, :timestamp, :tree_id]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      author: {GitHubOpenAPI.NullableSimpleCommitAuthor, :t},
      committer: {GitHubOpenAPI.NullableSimpleCommitCommitter, :t},
      id: {:string, :generic},
      message: {:string, :generic},
      timestamp: {:string, :date_time},
      tree_id: {:string, :generic}
    ]
  end
end
