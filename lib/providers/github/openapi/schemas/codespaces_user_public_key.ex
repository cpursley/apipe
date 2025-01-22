defmodule GitHubOpenAPI.CodespacesUserPublicKey do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :key, :string
    field :key_id, :string
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:key, :key_id, :__info__, :__joins__])
    
  end
end
