defmodule GitHubOpenAPI.TimelineReviewedEventLinks do
  @moduledoc """
  Provides struct and type for a TimelineReviewedEventLinks
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          html: GitHubOpenAPI.TimelineReviewedEventLinksHtml.t(),
          pull_request: GitHubOpenAPI.TimelineReviewedEventLinksPullRequest.t()
        }

  defstruct [:__info__, :__joins__, :html, :pull_request]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      html: {GitHubOpenAPI.TimelineReviewedEventLinksHtml, :t},
      pull_request: {GitHubOpenAPI.TimelineReviewedEventLinksPullRequest, :t}
    ]
  end
end
