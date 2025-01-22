defmodule GitHubOpenAPI.ActionsVariable do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :created_at, :string
    field :name, :string
    field :updated_at, :string
    field :value, :string
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:created_at, :name, :updated_at, :value, :__info__, :__joins__])
    
  end
end
