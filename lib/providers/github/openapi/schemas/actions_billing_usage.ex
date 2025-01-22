defmodule GitHubOpenAPI.ActionsBillingUsage do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :included_minutes, :integer
    field :minutes_used_breakdown, :map
    field :total_minutes_used, :integer
    field :total_paid_minutes_used, :integer
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:included_minutes, :total_minutes_used, :total_paid_minutes_used, :__info__, :__joins__])
    
  end
end
