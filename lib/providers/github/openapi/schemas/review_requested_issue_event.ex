defmodule GitHubOpenAPI.ReviewRequestedIssueEvent do
  @moduledoc """
  Provides struct and type for a ReviewRequestedIssueEvent
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          actor: GitHubOpenAPI.SimpleUser.t(),
          commit_id: String.t() | nil,
          commit_url: String.t() | nil,
          created_at: String.t(),
          event: String.t(),
          id: integer,
          node_id: String.t(),
          performed_via_github_app: GitHubOpenAPI.NullableIntegration.t(),
          requested_reviewer: GitHubOpenAPI.SimpleUser.t() | nil,
          requested_team: GitHubOpenAPI.Team.t() | nil,
          review_requester: GitHubOpenAPI.SimpleUser.t(),
          url: String.t()
        }

  defstruct [
    :__info__,
    :__joins__,
    :actor,
    :commit_id,
    :commit_url,
    :created_at,
    :event,
    :id,
    :node_id,
    :performed_via_github_app,
    :requested_reviewer,
    :requested_team,
    :review_requester,
    :url
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      actor: {GitHubOpenAPI.SimpleUser, :t},
      commit_id: {:string, :generic},
      commit_url: {:string, :generic},
      created_at: {:string, :generic},
      event: {:string, :generic},
      id: :integer,
      node_id: {:string, :generic},
      performed_via_github_app: {GitHubOpenAPI.NullableIntegration, :t},
      requested_reviewer: {GitHubOpenAPI.SimpleUser, :t},
      requested_team: {GitHubOpenAPI.Team, :t},
      review_requester: {GitHubOpenAPI.SimpleUser, :t},
      url: {:string, :generic}
    ]
  end
end
