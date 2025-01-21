defmodule GitHubOpenAPI.SecretScanningLocation do
  @moduledoc """
  Provides struct and type for a SecretScanningLocation
  """
  use Apipe.Providers.OpenAPIEncoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          details:
            GitHubOpenAPI.SecretScanningLocationCommit.t()
            | GitHubOpenAPI.SecretScanningLocationDiscussionBody.t()
            | GitHubOpenAPI.SecretScanningLocationDiscussionComment.t()
            | GitHubOpenAPI.SecretScanningLocationDiscussionTitle.t()
            | GitHubOpenAPI.SecretScanningLocationIssueBody.t()
            | GitHubOpenAPI.SecretScanningLocationIssueComment.t()
            | GitHubOpenAPI.SecretScanningLocationIssueTitle.t()
            | GitHubOpenAPI.SecretScanningLocationPullRequestBody.t()
            | GitHubOpenAPI.SecretScanningLocationPullRequestComment.t()
            | GitHubOpenAPI.SecretScanningLocationPullRequestReview.t()
            | GitHubOpenAPI.SecretScanningLocationPullRequestReviewComment.t()
            | GitHubOpenAPI.SecretScanningLocationPullRequestTitle.t()
            | GitHubOpenAPI.SecretScanningLocationWikiCommit.t()
            | nil,
          type: String.t() | nil
        }

  defstruct [:__info__, :__joins__, :details, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      details:
        {:union,
         [
           {GitHubOpenAPI.SecretScanningLocationCommit, :t},
           {GitHubOpenAPI.SecretScanningLocationDiscussionBody, :t},
           {GitHubOpenAPI.SecretScanningLocationDiscussionComment, :t},
           {GitHubOpenAPI.SecretScanningLocationDiscussionTitle, :t},
           {GitHubOpenAPI.SecretScanningLocationIssueBody, :t},
           {GitHubOpenAPI.SecretScanningLocationIssueComment, :t},
           {GitHubOpenAPI.SecretScanningLocationIssueTitle, :t},
           {GitHubOpenAPI.SecretScanningLocationPullRequestBody, :t},
           {GitHubOpenAPI.SecretScanningLocationPullRequestComment, :t},
           {GitHubOpenAPI.SecretScanningLocationPullRequestReview, :t},
           {GitHubOpenAPI.SecretScanningLocationPullRequestReviewComment, :t},
           {GitHubOpenAPI.SecretScanningLocationPullRequestTitle, :t},
           {GitHubOpenAPI.SecretScanningLocationWikiCommit, :t}
         ]},
      type:
        {:enum,
         [
           "commit",
           "wiki_commit",
           "issue_title",
           "issue_body",
           "issue_comment",
           "discussion_title",
           "discussion_body",
           "discussion_comment",
           "pull_request_title",
           "pull_request_body",
           "pull_request_comment",
           "pull_request_review",
           "pull_request_review_comment"
         ]}
    ]
  end
end
