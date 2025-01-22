defmodule GitHubOpenAPI.NullableGitUser do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :date, :string
    field :email, :string
    field :name, :string
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:date, :email, :name, :__info__, :__joins__])
    
  end
end
