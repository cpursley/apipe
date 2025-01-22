defmodule GitHubOpenAPI.ProjectColumn do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :cards_url, :string
    field :created_at, :string
    field :id, :integer
    field :name, :string
    field :node_id, :string
    field :project_url, :string
    field :updated_at, :string
    field :url, :string
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:cards_url, :created_at, :id, :name, :node_id, :project_url, :updated_at, :url, :__info__, :__joins__])
    
  end
end
