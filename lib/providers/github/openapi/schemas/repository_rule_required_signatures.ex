defmodule GitHubOpenAPI.RepositoryRuleRequiredSignatures do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :type, Ecto.Enum, values: [:required_signatures]
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:type, :__info__, :__joins__])
    
  end
end
