defmodule GitHubOpenAPI.AppPermissions do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :profile, Ecto.Enum, values: [:write]
    field :email_addresses, Ecto.Enum, values: [:read, :write]
    field :organization_custom_roles, Ecto.Enum, values: [:read, :write]
    field :packages, Ecto.Enum, values: [:read, :write]
    field :issues, Ecto.Enum, values: [:read, :write]
    field :secrets, Ecto.Enum, values: [:read, :write]
    field :team_discussions, Ecto.Enum, values: [:read, :write]
    field :metadata, Ecto.Enum, values: [:read, :write]
    field :repository_custom_properties, Ecto.Enum, values: [:read, :write]
    field :repository_hooks, Ecto.Enum, values: [:read, :write]
    field :secret_scanning_alerts, Ecto.Enum, values: [:read, :write]
    field :actions, Ecto.Enum, values: [:read, :write]
    field :organization_custom_properties, Ecto.Enum, values: [:read, :write, :admin]
    field :interaction_limits, Ecto.Enum, values: [:read, :write]
    field :organization_copilot_seat_management, Ecto.Enum, values: [:write]
    field :organization_projects, Ecto.Enum, values: [:read, :write, :admin]
    field :vulnerability_alerts, Ecto.Enum, values: [:read, :write]
    field :administration, Ecto.Enum, values: [:read, :write]
    field :members, Ecto.Enum, values: [:read, :write]
    field :organization_personal_access_tokens, Ecto.Enum, values: [:read, :write]
    field :organization_events, Ecto.Enum, values: [:read]
    field :organization_custom_org_roles, Ecto.Enum, values: [:read, :write]
    field :pull_requests, Ecto.Enum, values: [:read, :write]
    field :codespaces, Ecto.Enum, values: [:read, :write]
    field :checks, Ecto.Enum, values: [:read, :write]
    field :contents, Ecto.Enum, values: [:read, :write]
    field :organization_packages, Ecto.Enum, values: [:read, :write]
    field :organization_self_hosted_runners, Ecto.Enum, values: [:read, :write]
    field :organization_administration, Ecto.Enum, values: [:read, :write]
    field :environments, Ecto.Enum, values: [:read, :write]
    field :pages, Ecto.Enum, values: [:read, :write]
    field :organization_announcement_banners, Ecto.Enum, values: [:read, :write]
    field :repository_projects, Ecto.Enum, values: [:read, :write, :admin]
    field :git_ssh_keys, Ecto.Enum, values: [:read, :write]
    field :workflows, Ecto.Enum, values: [:write]
    field :starring, Ecto.Enum, values: [:read, :write]
    field :organization_secrets, Ecto.Enum, values: [:read, :write]
    field :organization_personal_access_token_requests, Ecto.Enum, values: [:read, :write]
    field :organization_hooks, Ecto.Enum, values: [:read, :write]
    field :gpg_keys, Ecto.Enum, values: [:read, :write]
    field :organization_user_blocking, Ecto.Enum, values: [:read, :write]
    field :single_file, Ecto.Enum, values: [:read, :write]
    field :deployments, Ecto.Enum, values: [:read, :write]
    field :organization_plan, Ecto.Enum, values: [:read]
    field :dependabot_secrets, Ecto.Enum, values: [:read, :write]
    field :security_events, Ecto.Enum, values: [:read, :write]
    field :followers, Ecto.Enum, values: [:read, :write]
    field :statuses, Ecto.Enum, values: [:read, :write]
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:profile, :email_addresses, :organization_custom_roles, :packages, :issues, :secrets, :team_discussions, :metadata, :repository_custom_properties, :repository_hooks, :secret_scanning_alerts, :actions, :organization_custom_properties, :interaction_limits, :organization_copilot_seat_management, :organization_projects, :vulnerability_alerts, :administration, :members, :organization_personal_access_tokens, :organization_events, :organization_custom_org_roles, :pull_requests, :codespaces, :checks, :contents, :organization_packages, :organization_self_hosted_runners, :organization_administration, :environments, :pages, :organization_announcement_banners, :repository_projects, :git_ssh_keys, :workflows, :starring, :organization_secrets, :organization_personal_access_token_requests, :organization_hooks, :gpg_keys, :organization_user_blocking, :single_file, :deployments, :organization_plan, :dependabot_secrets, :security_events, :followers, :statuses, :__info__, :__joins__])
    
  end
end
