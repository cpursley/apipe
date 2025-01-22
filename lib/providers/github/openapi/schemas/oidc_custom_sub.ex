defmodule GitHubOpenAPI.OidcCustomSub do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :include_claim_keys, {:array, :string}
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:include_claim_keys, :__info__, :__joins__])
    
  end
end
