defmodule GitHubOpenAPI.CombinedBillingUsage do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :days_left_in_billing_cycle, :integer
    field :estimated_paid_storage_for_month, :integer
    field :estimated_storage_for_month, :integer
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:days_left_in_billing_cycle, :estimated_paid_storage_for_month, :estimated_storage_for_month, :__info__, :__joins__])
    
  end
end
