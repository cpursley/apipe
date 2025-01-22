defmodule GitHubOpenAPI.CustomPropertyValue do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :property_name, :string
    field :value, :map
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:property_name, :value, :__info__, :__joins__])
    
  end
end
