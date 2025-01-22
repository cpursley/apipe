defmodule GitHubOpenAPI.WebhooksAlert do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :affected_package_name, :string
    field :affected_range, :string
    field :created_at, :string
    field :dismiss_reason, :string
    field :dismissed_at, :string
    field :dismisser, :map
    field :external_identifier, :string
    field :external_reference, :string
    field :fix_reason, :string
    field :fixed_at, :string
    field :fixed_in, :string
    field :ghsa_id, :string
    field :id, :integer
    field :node_id, :string
    field :number, :integer
    field :severity, :string
    field :state, Ecto.Enum, values: [:open]
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:affected_package_name, :affected_range, :created_at, :dismiss_reason, :dismissed_at, :external_identifier, :external_reference, :fix_reason, :fixed_at, :fixed_in, :ghsa_id, :id, :node_id, :number, :severity, :state, :__info__, :__joins__])
    
  end
end
