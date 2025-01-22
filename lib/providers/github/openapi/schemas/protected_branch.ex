defmodule GitHubOpenAPI.ProtectedBranch do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :allow_deletions, {:map, :string}
    field :allow_force_pushes, {:map, :string}
    field :allow_fork_syncing, {:map, :string}
    field :block_creations, {:map, :string}
    field :enforce_admins, {:map, :string}
    field :lock_branch, {:map, :string}
    field :required_conversation_resolution, {:map, :string}
    field :required_linear_history, {:map, :string}
    field :required_pull_request_reviews, :map
    field :required_signatures, :map
    field :url, :string
    embeds_one :required_status_checks, GitHubOpenAPI.StatusCheckPolicy
    embeds_one :restrictions, GitHubOpenAPI.BranchRestrictionPolicy
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:url, :__info__, :__joins__])
        |> cast_embed(:required_status_checks, with: &GitHubOpenAPI.StatusCheckPolicy.changeset/2)
    |> cast_embed(:restrictions, with: &GitHubOpenAPI.BranchRestrictionPolicy.changeset/2)
  end
end
