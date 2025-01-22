defmodule GitHubOpenAPI.ReviewDismissedIssueEventDismissedReview do
  @moduledoc """
  Provides struct and type for a ReviewDismissedIssueEventDismissedReview
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          dismissal_commit_id: String.t() | nil,
          dismissal_message: String.t() | nil,
          review_id: integer,
          state: String.t()
        }

  defstruct [:__info__, :__joins__, :dismissal_commit_id, :dismissal_message, :review_id, :state]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      dismissal_commit_id: {:string, :generic},
      dismissal_message: {:string, :generic},
      review_id: :integer,
      state: {:string, :generic}
    ]
  end
end
