defmodule GitHubOpenAPI.Verification do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :payload, :string
    field :reason, :string
    field :signature, :string
    field :verified, :boolean
    field :verified_at, :string
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:payload, :reason, :signature, :verified, :verified_at, :__info__, :__joins__])
    
  end
end
