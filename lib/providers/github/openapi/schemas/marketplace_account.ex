defmodule GitHubOpenAPI.MarketplaceAccount do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :email, :string
    field :id, :integer
    field :login, :string
    field :node_id, :string
    field :organization_billing_email, :string
    field :type, :string
    field :url, :string
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:email, :id, :login, :node_id, :organization_billing_email, :type, :url, :__info__, :__joins__])
    
  end
end
