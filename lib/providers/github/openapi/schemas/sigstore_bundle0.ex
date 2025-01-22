defmodule GitHubOpenAPI.SigstoreBundle0 do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :dsse_envelope, :map
    field :media_type, :string
    field :verification_material, :map
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:media_type, :__info__, :__joins__])
    
  end
end
