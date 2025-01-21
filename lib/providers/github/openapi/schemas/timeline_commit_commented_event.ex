defmodule GitHubOpenAPI.TimelineCommitCommentedEvent do
  @moduledoc """
  Provides struct and type for a TimelineCommitCommentedEvent
  """
  use Apipe.Providers.OpenAPIEncoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          comments: [GitHubOpenAPI.CommitComment.t()] | nil,
          commit_id: String.t() | nil,
          event: String.t() | nil,
          node_id: String.t() | nil
        }

  defstruct [:__info__, :__joins__, :comments, :commit_id, :event, :node_id]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      comments: [{GitHubOpenAPI.CommitComment, :t}],
      commit_id: {:string, :generic},
      event: {:string, :generic},
      node_id: {:string, :generic}
    ]
  end
end
