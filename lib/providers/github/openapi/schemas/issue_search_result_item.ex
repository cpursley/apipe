defmodule GitHubOpenAPI.IssueSearchResultItem do
  @moduledoc """
  Provides struct and type for a IssueSearchResultItem
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          active_lock_reason: String.t() | nil,
          assignee: GitHubOpenAPI.NullableSimpleUser.t(),
          assignees: [GitHubOpenAPI.SimpleUser.t()] | nil,
          author_association: String.t(),
          body: String.t() | nil,
          body_html: String.t() | nil,
          body_text: String.t() | nil,
          closed_at: DateTime.t() | nil,
          comments: integer,
          comments_url: String.t(),
          created_at: DateTime.t(),
          draft: boolean | nil,
          events_url: String.t(),
          html_url: String.t(),
          id: integer,
          labels: [GitHubOpenAPI.IssueSearchResultItemLabels.t()],
          labels_url: String.t(),
          locked: boolean,
          milestone: GitHubOpenAPI.NullableMilestone.t(),
          node_id: String.t(),
          number: integer,
          performed_via_github_app: GitHubOpenAPI.NullableIntegration.t() | nil,
          pull_request: GitHubOpenAPI.IssueSearchResultItemPullRequest.t() | nil,
          reactions: GitHubOpenAPI.ReactionRollup.t() | nil,
          repository: GitHubOpenAPI.Repository.t() | nil,
          repository_url: String.t(),
          score: number,
          state: String.t(),
          state_reason: String.t() | nil,
          sub_issues_summary: GitHubOpenAPI.SubIssuesSummary.t() | nil,
          text_matches: [GitHubOpenAPI.SearchResultTextMatches.t()] | nil,
          timeline_url: String.t() | nil,
          title: String.t(),
          updated_at: DateTime.t(),
          url: String.t(),
          user: GitHubOpenAPI.NullableSimpleUser.t()
        }

  defstruct [
    :__info__,
    :__joins__,
    :active_lock_reason,
    :assignee,
    :assignees,
    :author_association,
    :body,
    :body_html,
    :body_text,
    :closed_at,
    :comments,
    :comments_url,
    :created_at,
    :draft,
    :events_url,
    :html_url,
    :id,
    :labels,
    :labels_url,
    :locked,
    :milestone,
    :node_id,
    :number,
    :performed_via_github_app,
    :pull_request,
    :reactions,
    :repository,
    :repository_url,
    :score,
    :state,
    :state_reason,
    :sub_issues_summary,
    :text_matches,
    :timeline_url,
    :title,
    :updated_at,
    :url,
    :user
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      active_lock_reason: {:string, :generic},
      assignee: {GitHubOpenAPI.NullableSimpleUser, :t},
      assignees: [{GitHubOpenAPI.SimpleUser, :t}],
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
      body: {:string, :generic},
      body_html: {:string, :generic},
      body_text: {:string, :generic},
      closed_at: {:string, :date_time},
      comments: :integer,
      comments_url: {:string, :uri},
      created_at: {:string, :date_time},
      draft: :boolean,
      events_url: {:string, :uri},
      html_url: {:string, :uri},
      id: :integer,
      labels: [{GitHubOpenAPI.IssueSearchResultItemLabels, :t}],
      labels_url: {:string, :generic},
      locked: :boolean,
      milestone: {GitHubOpenAPI.NullableMilestone, :t},
      node_id: {:string, :generic},
      number: :integer,
      performed_via_github_app: {GitHubOpenAPI.NullableIntegration, :t},
      pull_request: {GitHubOpenAPI.IssueSearchResultItemPullRequest, :t},
      reactions: {GitHubOpenAPI.ReactionRollup, :t},
      repository: {GitHubOpenAPI.Repository, :t},
      repository_url: {:string, :uri},
      score: :number,
      state: {:string, :generic},
      state_reason: {:string, :generic},
      sub_issues_summary: {GitHubOpenAPI.SubIssuesSummary, :t},
      text_matches: [{GitHubOpenAPI.SearchResultTextMatches, :t}],
      timeline_url: {:string, :uri},
      title: {:string, :generic},
      updated_at: {:string, :date_time},
      url: {:string, :uri},
      user: {GitHubOpenAPI.NullableSimpleUser, :t}
    ]
  end
end
