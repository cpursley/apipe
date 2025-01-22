defmodule GitHubOpenAPI.BranchProtection do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :allow_deletions, :map
    field :allow_force_pushes, :map
    field :allow_fork_syncing, :map
    field :block_creations, :map
    field :enabled, :boolean
    field :lock_branch, :map
    field :name, :string
    field :protection_url, :string
    field :required_conversation_resolution, :map
    field :required_linear_history, :map
    field :required_signatures, :map
    field :url, :string
    embeds_one :enforce_admins, GitHubOpenAPI.ProtectedBranchAdminEnforced
    embeds_one :required_pull_request_reviews, GitHubOpenAPI.ProtectedBranchPullRequestReview
    embeds_one :required_status_checks, GitHubOpenAPI.ProtectedBranchRequiredStatusCheck
    embeds_one :restrictions, GitHubOpenAPI.BranchRestrictionPolicy
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:enabled, :name, :protection_url, :url, :__info__, :__joins__])
        |> cast_embed(:enforce_admins, with: &GitHubOpenAPI.ProtectedBranchAdminEnforced.changeset/2)
    |> cast_embed(:required_pull_request_reviews, with: &GitHubOpenAPI.ProtectedBranchPullRequestReview.changeset/2)
    |> cast_embed(:required_status_checks, with: &GitHubOpenAPI.ProtectedBranchRequiredStatusCheck.changeset/2)
    |> cast_embed(:restrictions, with: &GitHubOpenAPI.BranchRestrictionPolicy.changeset/2)
  end
end
