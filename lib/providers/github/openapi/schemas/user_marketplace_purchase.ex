defmodule GitHubOpenAPI.UserMarketplacePurchase do
  @moduledoc """
  Provides struct and type for a UserMarketplacePurchase
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          account: GitHubOpenAPI.MarketplaceAccount.t(),
          billing_cycle: String.t(),
          free_trial_ends_on: DateTime.t() | nil,
          next_billing_date: DateTime.t() | nil,
          on_free_trial: boolean,
          plan: GitHubOpenAPI.MarketplaceListingPlan.t(),
          unit_count: integer | nil,
          updated_at: DateTime.t() | nil
        }

  defstruct [
    :__info__,
    :__joins__,
    :account,
    :billing_cycle,
    :free_trial_ends_on,
    :next_billing_date,
    :on_free_trial,
    :plan,
    :unit_count,
    :updated_at
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      account: {GitHubOpenAPI.MarketplaceAccount, :t},
      billing_cycle: {:string, :generic},
      free_trial_ends_on: {:string, :date_time},
      next_billing_date: {:string, :date_time},
      on_free_trial: :boolean,
      plan: {GitHubOpenAPI.MarketplaceListingPlan, :t},
      unit_count: :integer,
      updated_at: {:string, :date_time}
    ]
  end
end
