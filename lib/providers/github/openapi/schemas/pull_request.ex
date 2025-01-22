defmodule GitHubOpenAPI.PullRequest do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :state, Ecto.Enum, values: [:open, :closed]
    field :labels, {:array, :string}
    field :_links, :map
    field :review_comment_url, :string
    field :head, :map
    field :mergeable_state, :string
    field :commits_url, :string
    field :commits, :integer
    field :comments_url, :string
    field :base, :map
    field :issue_url, :string
    field :merge_commit_sha, :string
    field :changed_files, :integer
    field :deletions, :integer
    field :draft, :boolean
    field :merged, :boolean
    field :patch_url, :string
    field :diff_url, :string
    field :review_comments_url, :string
    field :review_comments, :integer
    field :merged_at, :string
    field :rebaseable, :boolean
    field :html_url, :string
    field :created_at, :string
    field :updated_at, :string
    field :closed_at, :string
    field :statuses_url, :string
    field :url, :string
    field :body, :string
    field :maintainer_can_modify, :boolean
    field :mergeable, :boolean
    field :node_id, :string
    field :active_lock_reason, :string
    field :number, :integer
    field :locked, :boolean
    field :id, :integer
    field :comments, :integer
    field :title, :string
    field :additions, :integer
    embeds_one :auto_merge, GitHubOpenAPI.AutoMerge
    embeds_one :milestone, GitHubOpenAPI.NullableMilestone
    embeds_one :author_association, GitHubOpenAPI.AuthorAssociation
    embeds_one :assignee, GitHubOpenAPI.NullableSimpleUser
    embeds_many :assignees, GitHubOpenAPI.SimpleUser
    embeds_many :requested_reviewers, GitHubOpenAPI.SimpleUser
    embeds_one :user, GitHubOpenAPI.SimpleUser
    embeds_many :requested_teams, GitHubOpenAPI.TeamSimple
    embeds_one :merged_by, GitHubOpenAPI.NullableSimpleUser
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:state, :labels, :review_comment_url, :mergeable_state, :commits_url, :commits, :comments_url, :issue_url, :merge_commit_sha, :changed_files, :deletions, :draft, :merged, :patch_url, :diff_url, :review_comments_url, :review_comments, :merged_at, :rebaseable, :html_url, :created_at, :updated_at, :closed_at, :statuses_url, :url, :body, :maintainer_can_modify, :mergeable, :node_id, :active_lock_reason, :number, :locked, :id, :comments, :title, :additions, :__info__, :__joins__])
        |> cast_embed(:auto_merge, with: &GitHubOpenAPI.AutoMerge.changeset/2)
    |> cast_embed(:milestone, with: &GitHubOpenAPI.NullableMilestone.changeset/2)
    |> cast_embed(:author_association, with: &GitHubOpenAPI.AuthorAssociation.changeset/2)
    |> cast_embed(:assignee, with: &GitHubOpenAPI.NullableSimpleUser.changeset/2)
    |> cast_embed(:assignees, with: &GitHubOpenAPI.SimpleUser.changeset/2)
    |> cast_embed(:requested_reviewers, with: &GitHubOpenAPI.SimpleUser.changeset/2)
    |> cast_embed(:user, with: &GitHubOpenAPI.SimpleUser.changeset/2)
    |> cast_embed(:requested_teams, with: &GitHubOpenAPI.TeamSimple.changeset/2)
    |> cast_embed(:merged_by, with: &GitHubOpenAPI.NullableSimpleUser.changeset/2)
  end
end
