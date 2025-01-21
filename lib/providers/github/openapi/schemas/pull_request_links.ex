defmodule GitHubOpenAPI.PullRequestLinks do
  @moduledoc """
  Provides struct and type for a PullRequestLinks
  """
  use Apipe.Providers.OpenAPIEncoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          comments: GitHubOpenAPI.Link.t(),
          commits: GitHubOpenAPI.Link.t(),
          html: GitHubOpenAPI.Link.t(),
          issue: GitHubOpenAPI.Link.t(),
          review_comment: GitHubOpenAPI.Link.t(),
          review_comments: GitHubOpenAPI.Link.t(),
          self: GitHubOpenAPI.Link.t(),
          statuses: GitHubOpenAPI.Link.t()
        }

  defstruct [
    :__info__,
    :__joins__,
    :comments,
    :commits,
    :html,
    :issue,
    :review_comment,
    :review_comments,
    :self,
    :statuses
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      comments: {GitHubOpenAPI.Link, :t},
      commits: {GitHubOpenAPI.Link, :t},
      html: {GitHubOpenAPI.Link, :t},
      issue: {GitHubOpenAPI.Link, :t},
      review_comment: {GitHubOpenAPI.Link, :t},
      review_comments: {GitHubOpenAPI.Link, :t},
      self: {GitHubOpenAPI.Link, :t},
      statuses: {GitHubOpenAPI.Link, :t}
    ]
  end
end
