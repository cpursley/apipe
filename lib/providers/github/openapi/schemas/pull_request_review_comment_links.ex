defmodule GitHubOpenAPI.PullRequestReviewCommentLinks do
  @moduledoc """
  Provides struct and type for a PullRequestReviewCommentLinks
  """
  use Apipe.Providers.OpenAPIEncoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          html: GitHubOpenAPI.PullRequestReviewCommentLinksHtml.t(),
          pull_request: GitHubOpenAPI.PullRequestReviewCommentLinksPullRequest.t(),
          self: GitHubOpenAPI.PullRequestReviewCommentLinksSelf.t()
        }

  defstruct [:__info__, :__joins__, :html, :pull_request, :self]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      html: {GitHubOpenAPI.PullRequestReviewCommentLinksHtml, :t},
      pull_request: {GitHubOpenAPI.PullRequestReviewCommentLinksPullRequest, :t},
      self: {GitHubOpenAPI.PullRequestReviewCommentLinksSelf, :t}
    ]
  end
end
