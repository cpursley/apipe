defmodule GitHubOpenAPI.PullRequestReviewLinks do
  @moduledoc """
  Provides struct and type for a PullRequestReviewLinks
  """
  use Apipe.Providers.OpenAPIEncoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          html: GitHubOpenAPI.PullRequestReviewLinksHtml.t(),
          pull_request: GitHubOpenAPI.PullRequestReviewLinksPullRequest.t()
        }

  defstruct [:__info__, :__joins__, :html, :pull_request]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      html: {GitHubOpenAPI.PullRequestReviewLinksHtml, :t},
      pull_request: {GitHubOpenAPI.PullRequestReviewLinksPullRequest, :t}
    ]
  end
end
