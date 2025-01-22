defmodule GitHubOpenAPI.SimpleRepository do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :contents_url, :string
    field :languages_url, :string
    field :name, :string
    field :releases_url, :string
    field :git_refs_url, :string
    field :commits_url, :string
    field :subscribers_url, :string
    field :description, :string
    field :branches_url, :string
    field :issue_comment_url, :string
    field :comments_url, :string
    field :archive_url, :string
    field :git_tags_url, :string
    field :private, :boolean
    field :issues_url, :string
    field :tags_url, :string
    field :forks_url, :string
    field :assignees_url, :string
    field :deployments_url, :string
    field :merges_url, :string
    field :issue_events_url, :string
    field :contributors_url, :string
    field :pulls_url, :string
    field :html_url, :string
    field :events_url, :string
    field :milestones_url, :string
    field :statuses_url, :string
    field :url, :string
    field :subscription_url, :string
    field :trees_url, :string
    field :compare_url, :string
    field :notifications_url, :string
    field :node_id, :string
    field :collaborators_url, :string
    field :blobs_url, :string
    field :stargazers_url, :string
    field :downloads_url, :string
    field :git_commits_url, :string
    field :full_name, :string
    field :teams_url, :string
    field :id, :integer
    field :hooks_url, :string
    field :fork, :boolean
    field :keys_url, :string
    field :labels_url, :string
    embeds_one :owner, GitHubOpenAPI.SimpleUser
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:contents_url, :languages_url, :name, :releases_url, :git_refs_url, :commits_url, :subscribers_url, :description, :branches_url, :issue_comment_url, :comments_url, :archive_url, :git_tags_url, :private, :issues_url, :tags_url, :forks_url, :assignees_url, :deployments_url, :merges_url, :issue_events_url, :contributors_url, :pulls_url, :html_url, :events_url, :milestones_url, :statuses_url, :url, :subscription_url, :trees_url, :compare_url, :notifications_url, :node_id, :collaborators_url, :blobs_url, :stargazers_url, :downloads_url, :git_commits_url, :full_name, :teams_url, :id, :hooks_url, :fork, :keys_url, :labels_url, :__info__, :__joins__])
        |> cast_embed(:owner, with: &GitHubOpenAPI.SimpleUser.changeset/2)
  end
end
