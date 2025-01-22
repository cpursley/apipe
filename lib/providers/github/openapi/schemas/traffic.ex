defmodule GitHubOpenAPI.Traffic do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :count, :integer
    field :timestamp, :string
    field :uniques, :integer
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:count, :timestamp, :uniques, :__info__, :__joins__])
    
  end
end
