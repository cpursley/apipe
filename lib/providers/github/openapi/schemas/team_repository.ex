defmodule GitHubOpenAPI.TeamRepository do
  @moduledoc """
  Provides struct and type for a TeamRepository
  """
  use Apipe.Providers.OpenAPIEncoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          allow_auto_merge: boolean | nil,
          allow_forking: boolean | nil,
          allow_merge_commit: boolean | nil,
          allow_rebase_merge: boolean | nil,
          allow_squash_merge: boolean | nil,
          archive_url: String.t(),
          archived: boolean,
          assignees_url: String.t(),
          blobs_url: String.t(),
          branches_url: String.t(),
          clone_url: String.t(),
          collaborators_url: String.t(),
          comments_url: String.t(),
          commits_url: String.t(),
          compare_url: String.t(),
          contents_url: String.t(),
          contributors_url: String.t(),
          created_at: DateTime.t() | nil,
          default_branch: String.t(),
          delete_branch_on_merge: boolean | nil,
          deployments_url: String.t(),
          description: String.t() | nil,
          disabled: boolean,
          downloads_url: String.t(),
          events_url: String.t(),
          fork: boolean,
          forks: integer,
          forks_count: integer,
          forks_url: String.t(),
          full_name: String.t(),
          git_commits_url: String.t(),
          git_refs_url: String.t(),
          git_tags_url: String.t(),
          git_url: String.t(),
          has_downloads: boolean,
          has_issues: boolean,
          has_pages: boolean,
          has_projects: boolean,
          has_wiki: boolean,
          homepage: String.t() | nil,
          hooks_url: String.t(),
          html_url: String.t(),
          id: integer,
          is_template: boolean | nil,
          issue_comment_url: String.t(),
          issue_events_url: String.t(),
          issues_url: String.t(),
          keys_url: String.t(),
          labels_url: String.t(),
          language: String.t() | nil,
          languages_url: String.t(),
          license: GitHubOpenAPI.LicenseSimple.t() | nil,
          master_branch: String.t() | nil,
          merges_url: String.t(),
          milestones_url: String.t(),
          mirror_url: String.t() | nil,
          name: String.t(),
          network_count: integer | nil,
          node_id: String.t(),
          notifications_url: String.t(),
          open_issues: integer,
          open_issues_count: integer,
          owner: GitHubOpenAPI.SimpleUser.t() | nil,
          permissions: GitHubOpenAPI.TeamRepositoryPermissions.t() | nil,
          private: boolean,
          pulls_url: String.t(),
          pushed_at: DateTime.t() | nil,
          releases_url: String.t(),
          role_name: String.t() | nil,
          size: integer,
          ssh_url: String.t(),
          stargazers_count: integer,
          stargazers_url: String.t(),
          statuses_url: String.t(),
          subscribers_count: integer | nil,
          subscribers_url: String.t(),
          subscription_url: String.t(),
          svn_url: String.t(),
          tags_url: String.t(),
          teams_url: String.t(),
          temp_clone_token: String.t() | nil,
          topics: [String.t()] | nil,
          trees_url: String.t(),
          updated_at: DateTime.t() | nil,
          url: String.t(),
          visibility: String.t() | nil,
          watchers: integer,
          watchers_count: integer,
          web_commit_signoff_required: boolean | nil
        }

  defstruct [
    :__info__,
    :__joins__,
    :allow_auto_merge,
    :allow_forking,
    :allow_merge_commit,
    :allow_rebase_merge,
    :allow_squash_merge,
    :archive_url,
    :archived,
    :assignees_url,
    :blobs_url,
    :branches_url,
    :clone_url,
    :collaborators_url,
    :comments_url,
    :commits_url,
    :compare_url,
    :contents_url,
    :contributors_url,
    :created_at,
    :default_branch,
    :delete_branch_on_merge,
    :deployments_url,
    :description,
    :disabled,
    :downloads_url,
    :events_url,
    :fork,
    :forks,
    :forks_count,
    :forks_url,
    :full_name,
    :git_commits_url,
    :git_refs_url,
    :git_tags_url,
    :git_url,
    :has_downloads,
    :has_issues,
    :has_pages,
    :has_projects,
    :has_wiki,
    :homepage,
    :hooks_url,
    :html_url,
    :id,
    :is_template,
    :issue_comment_url,
    :issue_events_url,
    :issues_url,
    :keys_url,
    :labels_url,
    :language,
    :languages_url,
    :license,
    :master_branch,
    :merges_url,
    :milestones_url,
    :mirror_url,
    :name,
    :network_count,
    :node_id,
    :notifications_url,
    :open_issues,
    :open_issues_count,
    :owner,
    :permissions,
    :private,
    :pulls_url,
    :pushed_at,
    :releases_url,
    :role_name,
    :size,
    :ssh_url,
    :stargazers_count,
    :stargazers_url,
    :statuses_url,
    :subscribers_count,
    :subscribers_url,
    :subscription_url,
    :svn_url,
    :tags_url,
    :teams_url,
    :temp_clone_token,
    :topics,
    :trees_url,
    :updated_at,
    :url,
    :visibility,
    :watchers,
    :watchers_count,
    :web_commit_signoff_required
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      allow_auto_merge: :boolean,
      allow_forking: :boolean,
      allow_merge_commit: :boolean,
      allow_rebase_merge: :boolean,
      allow_squash_merge: :boolean,
      archive_url: {:string, :generic},
      archived: :boolean,
      assignees_url: {:string, :generic},
      blobs_url: {:string, :generic},
      branches_url: {:string, :generic},
      clone_url: {:string, :generic},
      collaborators_url: {:string, :generic},
      comments_url: {:string, :generic},
      commits_url: {:string, :generic},
      compare_url: {:string, :generic},
      contents_url: {:string, :generic},
      contributors_url: {:string, :uri},
      created_at: {:union, [{:string, :date_time}, :null]},
      default_branch: {:string, :generic},
      delete_branch_on_merge: :boolean,
      deployments_url: {:string, :uri},
      description: {:union, [{:string, :generic}, :null]},
      disabled: :boolean,
      downloads_url: {:string, :uri},
      events_url: {:string, :uri},
      fork: :boolean,
      forks: :integer,
      forks_count: :integer,
      forks_url: {:string, :uri},
      full_name: {:string, :generic},
      git_commits_url: {:string, :generic},
      git_refs_url: {:string, :generic},
      git_tags_url: {:string, :generic},
      git_url: {:string, :generic},
      has_downloads: :boolean,
      has_issues: :boolean,
      has_pages: :boolean,
      has_projects: :boolean,
      has_wiki: :boolean,
      homepage: {:union, [{:string, :uri}, :null]},
      hooks_url: {:string, :uri},
      html_url: {:string, :uri},
      id: :integer,
      is_template: :boolean,
      issue_comment_url: {:string, :generic},
      issue_events_url: {:string, :generic},
      issues_url: {:string, :generic},
      keys_url: {:string, :generic},
      labels_url: {:string, :generic},
      language: {:union, [{:string, :generic}, :null]},
      languages_url: {:string, :uri},
      license: {:union, [{GitHubOpenAPI.LicenseSimple, :t}, :null]},
      master_branch: {:string, :generic},
      merges_url: {:string, :uri},
      milestones_url: {:string, :generic},
      mirror_url: {:union, [{:string, :uri}, :null]},
      name: {:string, :generic},
      network_count: :integer,
      node_id: {:string, :generic},
      notifications_url: {:string, :generic},
      open_issues: :integer,
      open_issues_count: :integer,
      owner: {:union, [{GitHubOpenAPI.SimpleUser, :t}, :null]},
      permissions: {GitHubOpenAPI.TeamRepositoryPermissions, :t},
      private: :boolean,
      pulls_url: {:string, :generic},
      pushed_at: {:union, [{:string, :date_time}, :null]},
      releases_url: {:string, :generic},
      role_name: {:string, :generic},
      size: :integer,
      ssh_url: {:string, :generic},
      stargazers_count: :integer,
      stargazers_url: {:string, :uri},
      statuses_url: {:string, :generic},
      subscribers_count: :integer,
      subscribers_url: {:string, :uri},
      subscription_url: {:string, :uri},
      svn_url: {:string, :uri},
      tags_url: {:string, :uri},
      teams_url: {:string, :uri},
      temp_clone_token: {:string, :generic},
      topics: [string: :generic],
      trees_url: {:string, :generic},
      updated_at: {:union, [{:string, :date_time}, :null]},
      url: {:string, :uri},
      visibility: {:string, :generic},
      watchers: :integer,
      watchers_count: :integer,
      web_commit_signoff_required: :boolean
    ]
  end
end
