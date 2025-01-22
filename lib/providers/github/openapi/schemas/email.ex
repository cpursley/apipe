defmodule GitHubOpenAPI.Email do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :email, :string
    field :primary, :boolean
    field :verified, :boolean
    field :visibility, :string
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:email, :primary, :verified, :visibility, :__info__, :__joins__])
    
  end
end
