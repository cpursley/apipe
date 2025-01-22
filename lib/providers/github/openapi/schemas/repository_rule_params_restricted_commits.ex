defmodule GitHubOpenAPI.RepositoryRuleParamsRestrictedCommits do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :oid, :string
    field :reason, :string
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:oid, :reason, :__info__, :__joins__])
    
  end
end
