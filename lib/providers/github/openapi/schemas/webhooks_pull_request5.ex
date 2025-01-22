defmodule GitHubOpenAPI.WebhooksPullRequest5 do
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
    field :auto_merge, :map
    field :draft, :boolean
    field :merged, :boolean
    field :milestone, :map
    field :patch_url, :string
    field :author_association, Ecto.Enum, values: [:"COLLABORATOR", :"CONTRIBUTOR", :"FIRST_TIMER", :"FIRST_TIME_CONTRIBUTOR", :"MANNEQUIN", :"MEMBER", :"NONE", :"OWNER"]
    field :diff_url, :string
    field :assignee, :map
    field :review_comments_url, :string
    field :review_comments, :integer
    field :merged_at, :string
    field :assignees, {:array, :string}
    field :requested_reviewers, {:array, :string}
    field :rebaseable, :boolean
    field :html_url, :string
    field :created_at, :string
    field :updated_at, :string
    field :closed_at, :string
    field :statuses_url, :string
    field :url, :string
    field :body, :string
    field :user, :map
    field :maintainer_can_modify, :boolean
    field :mergeable, :boolean
    field :requested_teams, {:array, :string}
    field :node_id, :string
    field :active_lock_reason, Ecto.Enum, values: [:resolved, :"off-topic", :"too heated", :spam]
    field :number, :integer
    field :locked, :boolean
    field :merged_by, :map
    field :id, :integer
    field :comments, :integer
    field :title, :string
    field :additions, :integer
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:state, :labels, :review_comment_url, :mergeable_state, :commits_url, :commits, :comments_url, :issue_url, :merge_commit_sha, :changed_files, :deletions, :draft, :merged, :patch_url, :author_association, :diff_url, :review_comments_url, :review_comments, :merged_at, :assignees, :requested_reviewers, :rebaseable, :html_url, :created_at, :updated_at, :closed_at, :statuses_url, :url, :body, :maintainer_can_modify, :mergeable, :requested_teams, :node_id, :active_lock_reason, :number, :locked, :id, :comments, :title, :additions, :__info__, :__joins__])
    
  end
end
