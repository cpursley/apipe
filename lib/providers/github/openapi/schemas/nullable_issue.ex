defmodule GitHubOpenAPI.NullableIssue do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :state, :string
    field :labels, {:array, :string}
    field :body_html, :string
    field :comments_url, :string
    field :timeline_url, :string
    field :state_reason, Ecto.Enum, values: [:completed, :reopened, :not_planned]
    field :draft, :boolean
    field :pull_request, :map
    field :body_text, :string
    field :html_url, :string
    field :created_at, :string
    field :updated_at, :string
    field :events_url, :string
    field :closed_at, :string
    field :url, :string
    field :body, :string
    field :repository_url, :string
    field :node_id, :string
    field :active_lock_reason, :string
    field :number, :integer
    field :locked, :boolean
    field :id, :integer
    field :comments, :integer
    field :title, :string
    field :labels_url, :string
    embeds_one :sub_issues_summary, GitHubOpenAPI.SubIssuesSummary
    embeds_one :repository, GitHubOpenAPI.Repository
    embeds_one :milestone, GitHubOpenAPI.NullableMilestone
    embeds_one :author_association, GitHubOpenAPI.AuthorAssociation
    embeds_one :assignee, GitHubOpenAPI.NullableSimpleUser
    embeds_one :performed_via_github_app, GitHubOpenAPI.NullableIntegration
    embeds_many :assignees, GitHubOpenAPI.SimpleUser
    embeds_one :closed_by, GitHubOpenAPI.NullableSimpleUser
    embeds_one :user, GitHubOpenAPI.NullableSimpleUser
    embeds_one :reactions, GitHubOpenAPI.ReactionRollup
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:state, :labels, :body_html, :comments_url, :timeline_url, :state_reason, :draft, :body_text, :html_url, :created_at, :updated_at, :events_url, :closed_at, :url, :body, :repository_url, :node_id, :active_lock_reason, :number, :locked, :id, :comments, :title, :labels_url, :__info__, :__joins__])
        |> cast_embed(:sub_issues_summary, with: &GitHubOpenAPI.SubIssuesSummary.changeset/2)
    |> cast_embed(:repository, with: &GitHubOpenAPI.Repository.changeset/2)
    |> cast_embed(:milestone, with: &GitHubOpenAPI.NullableMilestone.changeset/2)
    |> cast_embed(:author_association, with: &GitHubOpenAPI.AuthorAssociation.changeset/2)
    |> cast_embed(:assignee, with: &GitHubOpenAPI.NullableSimpleUser.changeset/2)
    |> cast_embed(:performed_via_github_app, with: &GitHubOpenAPI.NullableIntegration.changeset/2)
    |> cast_embed(:assignees, with: &GitHubOpenAPI.SimpleUser.changeset/2)
    |> cast_embed(:closed_by, with: &GitHubOpenAPI.NullableSimpleUser.changeset/2)
    |> cast_embed(:user, with: &GitHubOpenAPI.NullableSimpleUser.changeset/2)
    |> cast_embed(:reactions, with: &GitHubOpenAPI.ReactionRollup.changeset/2)
  end
end
