defmodule GitHubOpenAPI.ContentTraffic do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :count, :integer
    field :path, :string
    field :title, :string
    field :uniques, :integer
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:count, :path, :title, :uniques, :__info__, :__joins__])
    
  end
end
