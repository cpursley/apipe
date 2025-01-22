defmodule GitHubOpenAPI.TagProtection do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :created_at, :string
    field :enabled, :boolean
    field :id, :integer
    field :pattern, :string
    field :updated_at, :string
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:created_at, :enabled, :id, :pattern, :updated_at, :__info__, :__joins__])
    
  end
end
