defmodule GitHubOpenAPI.SimpleCommit do
  @moduledoc """
  Provides struct and type for a SimpleCommit
  """
  use Apipe.Providers.OpenAPIEncoder

  @type t :: %__MODULE__{
          __info__: map,
          author: GitHubOpenAPI.SimpleCommitAuthor.t() | nil,
          committer: GitHubOpenAPI.SimpleCommitCommitter.t() | nil,
          id: String.t(),
          message: String.t(),
          timestamp: DateTime.t(),
          tree_id: String.t()
        }

  defstruct [:__info__, :author, :committer, :id, :message, :timestamp, :tree_id]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      author: {:union, [{GitHubOpenAPI.SimpleCommitAuthor, :t}, :null]},
      committer: {:union, [{GitHubOpenAPI.SimpleCommitCommitter, :t}, :null]},
      id: {:string, :generic},
      message: {:string, :generic},
      timestamp: {:string, :date_time},
      tree_id: {:string, :generic}
    ]
  end
end
