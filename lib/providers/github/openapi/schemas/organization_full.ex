defmodule GitHubOpenAPI.OrganizationFull do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :has_organization_projects, :boolean
    field :name, :string
    field :is_verified, :boolean
    field :private_gists, :integer
    field :secret_scanning_enabled_for_new_repositories, :boolean
    field :login, :string
    field :billing_email, :string
    field :description, :string
    field :email, :string
    field :company, :string
    field :members_can_create_public_repositories, :boolean
    field :members_can_create_private_pages, :boolean
    field :owned_private_repos, :integer
    field :secret_scanning_push_protection_enabled_for_new_repositories, :boolean
    field :issues_url, :string
    field :total_private_repos, :integer
    field :members_can_create_public_pages, :boolean
    field :members_url, :string
    field :public_repos, :integer
    field :members_can_fork_private_repositories, :boolean
    field :location, :string
    field :public_gists, :integer
    field :web_commit_signoff_required, :boolean
    field :dependency_graph_enabled_for_new_repositories, :boolean
    field :members_allowed_repository_creation_type, :string
    field :secret_scanning_push_protection_custom_link, :string
    field :html_url, :string
    field :created_at, :string
    field :updated_at, :string
    field :collaborators, :integer
    field :events_url, :string
    field :members_can_create_repositories, :boolean
    field :advanced_security_enabled_for_new_repositories, :boolean
    field :disk_usage, :integer
    field :avatar_url, :string
    field :archived_at, :string
    field :url, :string
    field :members_can_create_pages, :boolean
    field :type, :string
    field :members_can_create_private_repositories, :boolean
    field :node_id, :string
    field :secret_scanning_push_protection_custom_link_enabled, :boolean
    field :twitter_username, :string
    field :repos_url, :string
    field :dependabot_alerts_enabled_for_new_repositories, :boolean
    field :has_repository_projects, :boolean
    field :following, :integer
    field :blog, :string
    field :default_repository_permission, :string
    field :id, :integer
    field :followers, :integer
    field :public_members_url, :string
    field :deploy_keys_enabled_for_repositories, :boolean
    field :hooks_url, :string
    field :dependabot_security_updates_enabled_for_new_repositories, :boolean
    field :members_can_create_internal_repositories, :boolean
    field :two_factor_requirement_enabled, :boolean
    field :plan, :map
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:has_organization_projects, :name, :is_verified, :private_gists, :secret_scanning_enabled_for_new_repositories, :login, :billing_email, :description, :email, :company, :members_can_create_public_repositories, :members_can_create_private_pages, :owned_private_repos, :secret_scanning_push_protection_enabled_for_new_repositories, :issues_url, :total_private_repos, :members_can_create_public_pages, :members_url, :public_repos, :members_can_fork_private_repositories, :location, :public_gists, :web_commit_signoff_required, :dependency_graph_enabled_for_new_repositories, :members_allowed_repository_creation_type, :secret_scanning_push_protection_custom_link, :html_url, :created_at, :updated_at, :collaborators, :events_url, :members_can_create_repositories, :advanced_security_enabled_for_new_repositories, :disk_usage, :avatar_url, :archived_at, :url, :members_can_create_pages, :type, :members_can_create_private_repositories, :node_id, :secret_scanning_push_protection_custom_link_enabled, :twitter_username, :repos_url, :dependabot_alerts_enabled_for_new_repositories, :has_repository_projects, :following, :blog, :default_repository_permission, :id, :followers, :public_members_url, :deploy_keys_enabled_for_repositories, :hooks_url, :dependabot_security_updates_enabled_for_new_repositories, :members_can_create_internal_repositories, :two_factor_requirement_enabled, :__info__, :__joins__])
    
  end
end
