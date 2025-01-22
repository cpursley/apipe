defmodule GitHubOpenAPI.DeploymentProtectionRule do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :enabled, :boolean
    field :id, :integer
    field :node_id, :string
    embeds_one :app, GitHubOpenAPI.CustomDeploymentRuleApp
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:enabled, :id, :node_id, :__info__, :__joins__])
        |> cast_embed(:app, with: &GitHubOpenAPI.CustomDeploymentRuleApp.changeset/2)
  end
end
