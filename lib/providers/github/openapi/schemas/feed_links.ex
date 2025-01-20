defmodule GitHubOpenAPI.FeedLinks do
  @moduledoc """
  Provides struct and type for a FeedLinks
  """
  use Apipe.Providers.OpenAPIEncoder

  @type t :: %__MODULE__{
          __info__: map,
          current_user: GitHubOpenAPI.LinkWithType.t() | nil,
          current_user_actor: GitHubOpenAPI.LinkWithType.t() | nil,
          current_user_organization: GitHubOpenAPI.LinkWithType.t() | nil,
          current_user_organizations: [GitHubOpenAPI.LinkWithType.t()] | nil,
          current_user_public: GitHubOpenAPI.LinkWithType.t() | nil,
          repository_discussions: GitHubOpenAPI.LinkWithType.t() | nil,
          repository_discussions_category: GitHubOpenAPI.LinkWithType.t() | nil,
          security_advisories: GitHubOpenAPI.LinkWithType.t() | nil,
          timeline: GitHubOpenAPI.LinkWithType.t(),
          user: GitHubOpenAPI.LinkWithType.t()
        }

  defstruct [
    :__info__,
    :current_user,
    :current_user_actor,
    :current_user_organization,
    :current_user_organizations,
    :current_user_public,
    :repository_discussions,
    :repository_discussions_category,
    :security_advisories,
    :timeline,
    :user
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      current_user: {GitHubOpenAPI.LinkWithType, :t},
      current_user_actor: {GitHubOpenAPI.LinkWithType, :t},
      current_user_organization: {GitHubOpenAPI.LinkWithType, :t},
      current_user_organizations: [{GitHubOpenAPI.LinkWithType, :t}],
      current_user_public: {GitHubOpenAPI.LinkWithType, :t},
      repository_discussions: {GitHubOpenAPI.LinkWithType, :t},
      repository_discussions_category: {GitHubOpenAPI.LinkWithType, :t},
      security_advisories: {GitHubOpenAPI.LinkWithType, :t},
      timeline: {GitHubOpenAPI.LinkWithType, :t},
      user: {GitHubOpenAPI.LinkWithType, :t}
    ]
  end
end
