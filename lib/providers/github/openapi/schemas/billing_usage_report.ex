defmodule GitHubOpenAPI.BillingUsageReport do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :usage_items, {:array, :string}
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:usage_items, :__info__, :__joins__])
    
  end
end
