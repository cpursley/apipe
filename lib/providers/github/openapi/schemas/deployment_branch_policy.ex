defmodule GitHubOpenAPI.DeploymentBranchPolicy do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :id, :integer
    field :name, :string
    field :node_id, :string
    field :type, Ecto.Enum, values: [:branch, :tag]
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:id, :name, :node_id, :type, :__info__, :__joins__])
    
  end
end
