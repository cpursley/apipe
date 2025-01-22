defmodule GitHubOpenAPI.BranchShort do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :commit, :map
    field :name, :string
    field :protected, :boolean
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:name, :protected, :__info__, :__joins__])
    
  end
end
