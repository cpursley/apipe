defmodule GitHubOpenAPI.ApiInsightsSummaryStats do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :rate_limited_request_count, :integer
    field :total_request_count, :integer
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:rate_limited_request_count, :total_request_count, :__info__, :__joins__])
    
  end
end
