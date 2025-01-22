defmodule GitHubOpenAPI.IssueEvent do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :commit_id, :string
    field :commit_url, :string
    field :created_at, :string
    field :event, :string
    field :id, :integer
    field :lock_reason, :string
    field :node_id, :string
    field :url, :string
    embeds_one :actor, GitHubOpenAPI.NullableSimpleUser
    embeds_one :assignee, GitHubOpenAPI.NullableSimpleUser
    embeds_one :assigner, GitHubOpenAPI.NullableSimpleUser
    embeds_one :author_association, GitHubOpenAPI.AuthorAssociation
    embeds_one :dismissed_review, GitHubOpenAPI.IssueEventDismissedReview
    embeds_one :issue, GitHubOpenAPI.NullableIssue
    embeds_one :label, GitHubOpenAPI.IssueEventLabel
    embeds_one :milestone, GitHubOpenAPI.IssueEventMilestone
    embeds_one :performed_via_github_app, GitHubOpenAPI.NullableIntegration
    embeds_one :project_card, GitHubOpenAPI.IssueEventProjectCard
    embeds_one :rename, GitHubOpenAPI.IssueEventRename
    embeds_one :requested_reviewer, GitHubOpenAPI.NullableSimpleUser
    embeds_one :requested_team, GitHubOpenAPI.Team
    embeds_one :review_requester, GitHubOpenAPI.NullableSimpleUser
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:commit_id, :commit_url, :created_at, :event, :id, :lock_reason, :node_id, :url, :__info__, :__joins__])
        |> cast_embed(:actor, with: &GitHubOpenAPI.NullableSimpleUser.changeset/2)
    |> cast_embed(:assignee, with: &GitHubOpenAPI.NullableSimpleUser.changeset/2)
    |> cast_embed(:assigner, with: &GitHubOpenAPI.NullableSimpleUser.changeset/2)
    |> cast_embed(:author_association, with: &GitHubOpenAPI.AuthorAssociation.changeset/2)
    |> cast_embed(:dismissed_review, with: &GitHubOpenAPI.IssueEventDismissedReview.changeset/2)
    |> cast_embed(:issue, with: &GitHubOpenAPI.NullableIssue.changeset/2)
    |> cast_embed(:label, with: &GitHubOpenAPI.IssueEventLabel.changeset/2)
    |> cast_embed(:milestone, with: &GitHubOpenAPI.IssueEventMilestone.changeset/2)
    |> cast_embed(:performed_via_github_app, with: &GitHubOpenAPI.NullableIntegration.changeset/2)
    |> cast_embed(:project_card, with: &GitHubOpenAPI.IssueEventProjectCard.changeset/2)
    |> cast_embed(:rename, with: &GitHubOpenAPI.IssueEventRename.changeset/2)
    |> cast_embed(:requested_reviewer, with: &GitHubOpenAPI.NullableSimpleUser.changeset/2)
    |> cast_embed(:requested_team, with: &GitHubOpenAPI.Team.changeset/2)
    |> cast_embed(:review_requester, with: &GitHubOpenAPI.NullableSimpleUser.changeset/2)
  end
end
