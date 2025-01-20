defmodule GitHubOpenAPI.IssueEvent do
  @moduledoc """
  Provides struct and type for a IssueEvent
  """
  use Apipe.Providers.OpenAPIEncoder

  @type t :: %__MODULE__{
          __info__: map,
          actor: GitHubOpenAPI.SimpleUser.t() | nil,
          assignee: GitHubOpenAPI.SimpleUser.t() | nil,
          assigner: GitHubOpenAPI.SimpleUser.t() | nil,
          author_association: String.t() | nil,
          commit_id: String.t() | nil,
          commit_url: String.t() | nil,
          created_at: DateTime.t(),
          dismissed_review: GitHubOpenAPI.IssueEventDismissedReview.t() | nil,
          event: String.t(),
          id: integer,
          issue: GitHubOpenAPI.Issue.t() | nil,
          label: GitHubOpenAPI.IssueEventLabel.t() | nil,
          lock_reason: String.t() | nil,
          milestone: GitHubOpenAPI.IssueEventMilestone.t() | nil,
          node_id: String.t(),
          performed_via_github_app: GitHubOpenAPI.Integration.t() | nil,
          project_card: GitHubOpenAPI.IssueEventProjectCard.t() | nil,
          rename: GitHubOpenAPI.IssueEventRename.t() | nil,
          requested_reviewer: GitHubOpenAPI.SimpleUser.t() | nil,
          requested_team: GitHubOpenAPI.Team.t() | nil,
          review_requester: GitHubOpenAPI.SimpleUser.t() | nil,
          url: String.t()
        }

  defstruct [
    :__info__,
    :actor,
    :assignee,
    :assigner,
    :author_association,
    :commit_id,
    :commit_url,
    :created_at,
    :dismissed_review,
    :event,
    :id,
    :issue,
    :label,
    :lock_reason,
    :milestone,
    :node_id,
    :performed_via_github_app,
    :project_card,
    :rename,
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
      actor: {:union, [{GitHubOpenAPI.SimpleUser, :t}, :null]},
      assignee: {:union, [{GitHubOpenAPI.SimpleUser, :t}, :null]},
      assigner: {:union, [{GitHubOpenAPI.SimpleUser, :t}, :null]},
      author_association:
        {:enum,
         [
           "COLLABORATOR",
           "CONTRIBUTOR",
           "FIRST_TIMER",
           "FIRST_TIME_CONTRIBUTOR",
           "MANNEQUIN",
           "MEMBER",
           "NONE",
           "OWNER"
         ]},
      commit_id: {:union, [{:string, :generic}, :null]},
      commit_url: {:union, [{:string, :generic}, :null]},
      created_at: {:string, :date_time},
      dismissed_review: {GitHubOpenAPI.IssueEventDismissedReview, :t},
      event: {:string, :generic},
      id: :integer,
      issue: {:union, [{GitHubOpenAPI.Issue, :t}, :null]},
      label: {GitHubOpenAPI.IssueEventLabel, :t},
      lock_reason: {:union, [{:string, :generic}, :null]},
      milestone: {GitHubOpenAPI.IssueEventMilestone, :t},
      node_id: {:string, :generic},
      performed_via_github_app: {:union, [{GitHubOpenAPI.Integration, :t}, :null]},
      project_card: {GitHubOpenAPI.IssueEventProjectCard, :t},
      rename: {GitHubOpenAPI.IssueEventRename, :t},
      requested_reviewer: {:union, [{GitHubOpenAPI.SimpleUser, :t}, :null]},
      requested_team: {GitHubOpenAPI.Team, :t},
      review_requester: {:union, [{GitHubOpenAPI.SimpleUser, :t}, :null]},
      url: {:string, :uri}
    ]
  end
end
