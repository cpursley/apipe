defmodule GitHubOpenAPI.Key do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :created_at, :string
    field :id, :integer
    field :key, :string
    field :read_only, :boolean
    field :title, :string
    field :url, :string
    field :verified, :boolean
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:created_at, :id, :key, :read_only, :title, :url, :verified, :__info__, :__joins__])
    
  end
end
