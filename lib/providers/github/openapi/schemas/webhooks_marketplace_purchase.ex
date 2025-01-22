defmodule GitHubOpenAPI.WebhooksMarketplacePurchase do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :account, :map
    field :billing_cycle, :string
    field :free_trial_ends_on, :string
    field :next_billing_date, :string
    field :on_free_trial, :boolean
    field :plan, :map
    field :unit_count, :integer
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:billing_cycle, :free_trial_ends_on, :next_billing_date, :on_free_trial, :unit_count, :__info__, :__joins__])
    
  end
end
