defmodule GitHubOpenAPI.SshSigningKey do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :created_at, :string
    field :id, :integer
    field :key, :string
    field :title, :string
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:created_at, :id, :key, :title, :__info__, :__joins__])
    
  end
end
