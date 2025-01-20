defmodule GitHubOpenAPI.TimelineCommittedEvent do
  @moduledoc """
  Provides struct and type for a TimelineCommittedEvent
  """
  use Apipe.Providers.OpenAPIEncoder

  @type t :: %__MODULE__{
          __info__: map,
          author: GitHubOpenAPI.TimelineCommittedEventAuthor.t(),
          committer: GitHubOpenAPI.TimelineCommittedEventCommitter.t(),
          event: String.t() | nil,
          html_url: String.t(),
          message: String.t(),
          node_id: String.t(),
          parents: [GitHubOpenAPI.TimelineCommittedEventParents.t()],
          sha: String.t(),
          tree: GitHubOpenAPI.TimelineCommittedEventTree.t(),
          url: String.t(),
          verification: GitHubOpenAPI.TimelineCommittedEventVerification.t()
        }

  defstruct [
    :__info__,
    :author,
    :committer,
    :event,
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
      author: {GitHubOpenAPI.TimelineCommittedEventAuthor, :t},
      committer: {GitHubOpenAPI.TimelineCommittedEventCommitter, :t},
      event: {:string, :generic},
      html_url: {:string, :uri},
      message: {:string, :generic},
      node_id: {:string, :generic},
      parents: [{GitHubOpenAPI.TimelineCommittedEventParents, :t}],
      sha: {:string, :generic},
      tree: {GitHubOpenAPI.TimelineCommittedEventTree, :t},
      url: {:string, :uri},
      verification: {GitHubOpenAPI.TimelineCommittedEventVerification, :t}
    ]
  end
end
