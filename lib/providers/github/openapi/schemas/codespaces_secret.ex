defmodule GitHubOpenAPI.CodespacesSecret do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :created_at, :string
    field :name, :string
    field :selected_repositories_url, :string
    field :updated_at, :string
    field :visibility, Ecto.Enum, values: [:all, :private, :selected]
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:created_at, :name, :selected_repositories_url, :updated_at, :visibility, :__info__, :__joins__])
    
  end
end
