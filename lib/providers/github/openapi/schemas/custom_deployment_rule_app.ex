defmodule GitHubOpenAPI.CustomDeploymentRuleApp do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :id, :integer
    field :integration_url, :string
    field :node_id, :string
    field :slug, :string
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:id, :integration_url, :node_id, :slug, :__info__, :__joins__])
    
  end
end
