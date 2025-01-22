defmodule GitHubOpenAPI.RepositoryRulesetBypassActor do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :actor_id, :integer
    field :actor_type, Ecto.Enum, values: [:"Integration", :"OrganizationAdmin", :"RepositoryRole", :"Team", :"DeployKey"]
    field :bypass_mode, Ecto.Enum, values: [:always, :pull_request]
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:actor_id, :actor_type, :bypass_mode, :__info__, :__joins__])
    
  end
end
