defmodule GitHubOpenAPI.SimpleClassroom do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :archived, :boolean
    field :id, :integer
    field :name, :string
    field :url, :string
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:archived, :id, :name, :url, :__info__, :__joins__])
    
  end
end
