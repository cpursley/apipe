defmodule GitHubOpenAPI.DeploymentBranchPolicyNamePatternWithType do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :name, :string
    field :type, Ecto.Enum, values: [:branch, :tag]
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:name, :type, :__info__, :__joins__])
    
  end
end
