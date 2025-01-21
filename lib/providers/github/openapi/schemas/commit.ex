defmodule GitHubOpenAPI.Commit do
  @moduledoc """
  Provides struct and type for a Commit
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          author: GitHubOpenAPI.EmptyObject.t() | GitHubOpenAPI.SimpleUser.t(),
          comments_url: String.t(),
          commit: GitHubOpenAPI.CommitCommit.t(),
          committer: GitHubOpenAPI.EmptyObject.t() | GitHubOpenAPI.SimpleUser.t(),
          files: [GitHubOpenAPI.DiffEntry.t()] | nil,
          html_url: String.t(),
          node_id: String.t(),
          parents: [GitHubOpenAPI.CommitParents.t()],
          sha: String.t(),
          stats: GitHubOpenAPI.CommitStats.t() | nil,
          url: String.t()
        }

  defstruct [
    :__info__,
    :__joins__,
    :author,
    :comments_url,
    :commit,
    :committer,
    :files,
    :html_url,
    :node_id,
    :parents,
    :sha,
    :stats,
    :url
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      author: {:union, [{GitHubOpenAPI.EmptyObject, :t}, {GitHubOpenAPI.SimpleUser, :t}]},
      comments_url: {:string, :uri},
      commit: {GitHubOpenAPI.CommitCommit, :t},
      committer: {:union, [{GitHubOpenAPI.EmptyObject, :t}, {GitHubOpenAPI.SimpleUser, :t}]},
      files: [{GitHubOpenAPI.DiffEntry, :t}],
      html_url: {:string, :uri},
      node_id: {:string, :generic},
      parents: [{GitHubOpenAPI.CommitParents, :t}],
      sha: {:string, :generic},
      stats: {GitHubOpenAPI.CommitStats, :t},
      url: {:string, :uri}
    ]
  end
end
