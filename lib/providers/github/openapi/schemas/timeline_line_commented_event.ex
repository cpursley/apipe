defmodule GitHubOpenAPI.TimelineLineCommentedEvent do
  @moduledoc """
  Provides struct and type for a TimelineLineCommentedEvent
  """
  use Apipe.Providers.OpenAPIEncoder

  @type t :: %__MODULE__{
          __info__: map,
          comments: [GitHubOpenAPI.PullRequestReviewComment.t()] | nil,
          event: String.t() | nil,
          node_id: String.t() | nil
        }

  defstruct [:__info__, :comments, :event, :node_id]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      comments: [{GitHubOpenAPI.PullRequestReviewComment, :t}],
      event: {:string, :generic},
      node_id: {:string, :generic}
    ]
  end
end
