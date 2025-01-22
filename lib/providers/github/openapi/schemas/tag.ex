defmodule GitHubOpenAPI.Tag do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :commit, :map
    field :name, :string
    field :node_id, :string
    field :tarball_url, :string
    field :zipball_url, :string
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:name, :node_id, :tarball_url, :zipball_url, :__info__, :__joins__])
    
  end
end
