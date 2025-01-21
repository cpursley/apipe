defmodule GitHubOpenAPI.ProtectedBranchPullRequestReview do
  @moduledoc """
  Provides struct and type for a ProtectedBranchPullRequestReview
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          bypass_pull_request_allowances:
            GitHubOpenAPI.ProtectedBranchPullRequestReviewBypassPullRequestAllowances.t() | nil,
          dismiss_stale_reviews: boolean,
          dismissal_restrictions:
            GitHubOpenAPI.ProtectedBranchPullRequestReviewDismissalRestrictions.t() | nil,
          require_code_owner_reviews: boolean,
          require_last_push_approval: boolean | nil,
          required_approving_review_count: integer | nil,
          url: String.t() | nil
        }

  defstruct [
    :__info__,
    :__joins__,
    :bypass_pull_request_allowances,
    :dismiss_stale_reviews,
    :dismissal_restrictions,
    :require_code_owner_reviews,
    :require_last_push_approval,
    :required_approving_review_count,
    :url
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      bypass_pull_request_allowances:
        {GitHubOpenAPI.ProtectedBranchPullRequestReviewBypassPullRequestAllowances, :t},
      dismiss_stale_reviews: :boolean,
      dismissal_restrictions:
        {GitHubOpenAPI.ProtectedBranchPullRequestReviewDismissalRestrictions, :t},
      require_code_owner_reviews: :boolean,
      require_last_push_approval: :boolean,
      required_approving_review_count: :integer,
      url: {:string, :uri}
    ]
  end
end
