defmodule GitHubOpenAPI.ProjectsV2SingleSelectOption do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :color, :string
    field :description, :string
    field :id, :string
    field :name, :string
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:color, :description, :id, :name, :__info__, :__joins__])
    
  end
end
