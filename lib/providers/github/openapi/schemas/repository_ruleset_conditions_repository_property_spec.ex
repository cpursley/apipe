defmodule GitHubOpenAPI.RepositoryRulesetConditionsRepositoryPropertySpec do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :name, :string
    field :property_values, {:array, :string}
    field :source, Ecto.Enum, values: [:custom, :system]
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:name, :property_values, :source, :__info__, :__joins__])
    
  end
end
