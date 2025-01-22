defmodule GitHubOpenAPI.Label do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :color, :string
    field :default, :boolean
    field :description, :string
    field :id, :integer
    field :name, :string
    field :node_id, :string
    field :url, :string
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:color, :default, :description, :id, :name, :node_id, :url, :__info__, :__joins__])
    
  end
end
