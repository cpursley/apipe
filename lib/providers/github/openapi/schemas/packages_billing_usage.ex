defmodule GitHubOpenAPI.PackagesBillingUsage do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :included_gigabytes_bandwidth, :integer
    field :total_gigabytes_bandwidth_used, :integer
    field :total_paid_gigabytes_bandwidth_used, :integer
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:included_gigabytes_bandwidth, :total_gigabytes_bandwidth_used, :total_paid_gigabytes_bandwidth_used, :__info__, :__joins__])
    
  end
end
