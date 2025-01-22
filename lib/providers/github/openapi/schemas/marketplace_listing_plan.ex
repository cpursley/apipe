defmodule GitHubOpenAPI.MarketplaceListingPlan do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :accounts_url, :string
    field :bullets, {:array, :string}
    field :description, :string
    field :has_free_trial, :boolean
    field :id, :integer
    field :monthly_price_in_cents, :integer
    field :name, :string
    field :number, :integer
    field :price_model, Ecto.Enum, values: [:"FREE", :"FLAT_RATE", :"PER_UNIT"]
    field :state, :string
    field :unit_name, :string
    field :url, :string
    field :yearly_price_in_cents, :integer
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:accounts_url, :bullets, :description, :has_free_trial, :id, :monthly_price_in_cents, :name, :number, :price_model, :state, :unit_name, :url, :yearly_price_in_cents, :__info__, :__joins__])
    
  end
end
