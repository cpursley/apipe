defmodule GitHubOpenAPI.NullableRepositoryWebhooks do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :watchers, :integer
    field :allow_rebase_merge, :boolean
    field :allow_merge_commit, :boolean
    field :master_branch, :string
    field :contents_url, :string
    field :open_issues_count, :integer
    field :languages_url, :string
    field :custom_properties, {:map, :string}
    field :name, :string
    field :is_template, :boolean
    field :releases_url, :string
    field :ssh_url, :string
    field :template_repository, :map
    field :git_refs_url, :string
    field :squash_merge_commit_title, Ecto.Enum, values: [:"PR_TITLE", :"COMMIT_OR_PR_TITLE"]
    field :temp_clone_token, :string
    field :has_issues, :boolean
    field :squash_merge_commit_message, Ecto.Enum, values: [:"PR_BODY", :"COMMIT_MESSAGES", :"BLANK"]
    field :commits_url, :string
    field :has_discussions, :boolean
    field :stargazers_count, :integer
    field :subscribers_url, :string
    field :anonymous_access_enabled, :boolean
    field :description, :string
    field :merge_commit_message, Ecto.Enum, values: [:"PR_BODY", :"PR_TITLE", :"BLANK"]
    field :branches_url, :string
    field :issue_comment_url, :string
    field :has_pages, :boolean
    field :comments_url, :string
    field :archive_url, :string
    field :git_tags_url, :string
    field :forks_count, :integer
    field :disabled, :boolean
    field :private, :boolean
    field :homepage, :string
    field :issues_url, :string
    field :allow_squash_merge, :boolean
    field :pushed_at, :string
    field :size, :integer
    field :open_issues, :integer
    field :tags_url, :string
    field :forks_url, :string
    field :git_url, :string
    field :starred_at, :string
    field :assignees_url, :string
    field :visibility, :string
    field :deployments_url, :string
    field :allow_auto_merge, :boolean
    field :subscribers_count, :integer
    field :merges_url, :string
    field :forks, :integer
    field :issue_events_url, :string
    field :web_commit_signoff_required, :boolean
    field :contributors_url, :string
    field :language, :string
    field :topics, {:array, :string}
    field :has_wiki, :boolean
    field :delete_branch_on_merge, :boolean
    field :has_projects, :boolean
    field :mirror_url, :string
    field :pulls_url, :string
    field :allow_update_branch, :boolean
    field :allow_forking, :boolean
    field :archived, :boolean
    field :html_url, :string
    field :created_at, :string
    field :updated_at, :string
    field :events_url, :string
    field :svn_url, :string
    field :network_count, :integer
    field :milestones_url, :string
    field :use_squash_pr_title_as_default, :boolean
    field :statuses_url, :string
    field :url, :string
    field :subscription_url, :string
    field :merge_commit_title, Ecto.Enum, values: [:"PR_TITLE", :"MERGE_MESSAGE"]
    field :has_downloads, :boolean
    field :clone_url, :string
    field :trees_url, :string
    field :compare_url, :string
    field :notifications_url, :string
    field :watchers_count, :integer
    field :node_id, :string
    field :permissions, :map
    field :collaborators_url, :string
    field :blobs_url, :string
    field :stargazers_url, :string
    field :downloads_url, :string
    field :default_branch, :string
    field :git_commits_url, :string
    field :full_name, :string
    field :teams_url, :string
    field :id, :integer
    field :hooks_url, :string
    field :fork, :boolean
    field :keys_url, :string
    field :labels_url, :string
    embeds_one :organization, GitHubOpenAPI.NullableSimpleUser
    embeds_one :license, GitHubOpenAPI.NullableLicenseSimple
    embeds_one :owner, GitHubOpenAPI.SimpleUser
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:watchers, :allow_rebase_merge, :allow_merge_commit, :master_branch, :contents_url, :open_issues_count, :languages_url, :name, :is_template, :releases_url, :ssh_url, :git_refs_url, :squash_merge_commit_title, :temp_clone_token, :has_issues, :squash_merge_commit_message, :commits_url, :has_discussions, :stargazers_count, :subscribers_url, :anonymous_access_enabled, :description, :merge_commit_message, :branches_url, :issue_comment_url, :has_pages, :comments_url, :archive_url, :git_tags_url, :forks_count, :disabled, :private, :homepage, :issues_url, :allow_squash_merge, :pushed_at, :size, :open_issues, :tags_url, :forks_url, :git_url, :starred_at, :assignees_url, :visibility, :deployments_url, :allow_auto_merge, :subscribers_count, :merges_url, :forks, :issue_events_url, :web_commit_signoff_required, :contributors_url, :language, :topics, :has_wiki, :delete_branch_on_merge, :has_projects, :mirror_url, :pulls_url, :allow_update_branch, :allow_forking, :archived, :html_url, :created_at, :updated_at, :events_url, :svn_url, :network_count, :milestones_url, :use_squash_pr_title_as_default, :statuses_url, :url, :subscription_url, :merge_commit_title, :has_downloads, :clone_url, :trees_url, :compare_url, :notifications_url, :watchers_count, :node_id, :collaborators_url, :blobs_url, :stargazers_url, :downloads_url, :default_branch, :git_commits_url, :full_name, :teams_url, :id, :hooks_url, :fork, :keys_url, :labels_url, :__info__, :__joins__])
        |> cast_embed(:organization, with: &GitHubOpenAPI.NullableSimpleUser.changeset/2)
    |> cast_embed(:license, with: &GitHubOpenAPI.NullableLicenseSimple.changeset/2)
    |> cast_embed(:owner, with: &GitHubOpenAPI.SimpleUser.changeset/2)
  end
end
