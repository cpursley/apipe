defmodule GitHubOpenAPI.DeploymentBranchPolicySettings do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :custom_branch_policies, :boolean
    field :protected_branches, :boolean
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:custom_branch_policies, :protected_branches, :__info__, :__joins__])
    
  end
end
