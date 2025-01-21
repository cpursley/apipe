defmodule GitHubOpenAPI.ReviewCommentLinks do
  @moduledoc """
  Provides struct and type for a ReviewCommentLinks
  """
  use Apipe.Providers.OpenAPIEncoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          html: GitHubOpenAPI.Link.t(),
          pull_request: GitHubOpenAPI.Link.t(),
          self: GitHubOpenAPI.Link.t()
        }

  defstruct [:__info__, :__joins__, :html, :pull_request, :self]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      html: {GitHubOpenAPI.Link, :t},
      pull_request: {GitHubOpenAPI.Link, :t},
      self: {GitHubOpenAPI.Link, :t}
    ]
  end
end
