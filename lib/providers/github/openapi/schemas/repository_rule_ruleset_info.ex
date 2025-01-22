defmodule GitHubOpenAPI.RepositoryRuleRulesetInfo do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :ruleset_id, :integer
    field :ruleset_source, :string
    field :ruleset_source_type, Ecto.Enum, values: [:"Repository", :"Organization"]
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:ruleset_id, :ruleset_source, :ruleset_source_type, :__info__, :__joins__])
    
  end
end
