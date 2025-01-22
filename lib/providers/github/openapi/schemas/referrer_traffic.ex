defmodule GitHubOpenAPI.ReferrerTraffic do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :count, :integer
    field :referrer, :string
    field :uniques, :integer
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:count, :referrer, :uniques, :__info__, :__joins__])
    
  end
end
