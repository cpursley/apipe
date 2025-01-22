defmodule GitHubOpenAPI.UserMarketplacePurchase do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :billing_cycle, :string
    field :free_trial_ends_on, :string
    field :next_billing_date, :string
    field :on_free_trial, :boolean
    field :unit_count, :integer
    field :updated_at, :string
    embeds_one :account, GitHubOpenAPI.MarketplaceAccount
    embeds_one :plan, GitHubOpenAPI.MarketplaceListingPlan
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:billing_cycle, :free_trial_ends_on, :next_billing_date, :on_free_trial, :unit_count, :updated_at, :__info__, :__joins__])
        |> cast_embed(:account, with: &GitHubOpenAPI.MarketplaceAccount.changeset/2)
    |> cast_embed(:plan, with: &GitHubOpenAPI.MarketplaceListingPlan.changeset/2)
  end
end
