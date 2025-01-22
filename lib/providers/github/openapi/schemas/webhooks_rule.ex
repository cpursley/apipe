defmodule GitHubOpenAPI.WebhooksRule do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :admin_enforced, :boolean
    field :allow_deletions_enforcement_level, Ecto.Enum, values: [:off, :non_admins, :everyone]
    field :allow_force_pushes_enforcement_level, Ecto.Enum, values: [:off, :non_admins, :everyone]
    field :authorized_actor_names, {:array, :string}
    field :authorized_actors_only, :boolean
    field :authorized_dismissal_actors_only, :boolean
    field :create_protected, :boolean
    field :created_at, :string
    field :dismiss_stale_reviews_on_push, :boolean
    field :id, :integer
    field :ignore_approvals_from_contributors, :boolean
    field :linear_history_requirement_enforcement_level, Ecto.Enum, values: [:off, :non_admins, :everyone]
    field :lock_allows_fork_sync, :boolean
    field :lock_branch_enforcement_level, Ecto.Enum, values: [:off, :non_admins, :everyone]
    field :merge_queue_enforcement_level, Ecto.Enum, values: [:off, :non_admins, :everyone]
    field :name, :string
    field :pull_request_reviews_enforcement_level, Ecto.Enum, values: [:off, :non_admins, :everyone]
    field :repository_id, :integer
    field :require_code_owner_review, :boolean
    field :require_last_push_approval, :boolean
    field :required_approving_review_count, :integer
    field :required_conversation_resolution_level, Ecto.Enum, values: [:off, :non_admins, :everyone]
    field :required_deployments_enforcement_level, Ecto.Enum, values: [:off, :non_admins, :everyone]
    field :required_status_checks, {:array, :string}
    field :required_status_checks_enforcement_level, Ecto.Enum, values: [:off, :non_admins, :everyone]
    field :signature_requirement_enforcement_level, Ecto.Enum, values: [:off, :non_admins, :everyone]
    field :strict_required_status_checks_policy, :boolean
    field :updated_at, :string
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:admin_enforced, :allow_deletions_enforcement_level, :allow_force_pushes_enforcement_level, :authorized_actor_names, :authorized_actors_only, :authorized_dismissal_actors_only, :create_protected, :created_at, :dismiss_stale_reviews_on_push, :id, :ignore_approvals_from_contributors, :linear_history_requirement_enforcement_level, :lock_allows_fork_sync, :lock_branch_enforcement_level, :merge_queue_enforcement_level, :name, :pull_request_reviews_enforcement_level, :repository_id, :require_code_owner_review, :require_last_push_approval, :required_approving_review_count, :required_conversation_resolution_level, :required_deployments_enforcement_level, :required_status_checks, :required_status_checks_enforcement_level, :signature_requirement_enforcement_level, :strict_required_status_checks_policy, :updated_at, :__info__, :__joins__])
    
  end
end
