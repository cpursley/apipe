defmodule GitHubOpenAPI.MarketplacePurchase do
  @moduledoc """
  Provides struct and type for a MarketplacePurchase
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          email: String.t() | nil,
          id: integer,
          login: String.t(),
          marketplace_pending_change:
            GitHubOpenAPI.MarketplacePurchaseMarketplacePendingChange.t() | nil,
          marketplace_purchase: GitHubOpenAPI.MarketplacePurchaseMarketplacePurchase.t(),
          organization_billing_email: String.t() | nil,
          type: String.t(),
          url: String.t()
        }

  defstruct [
    :__info__,
    :__joins__,
    :email,
    :id,
    :login,
    :marketplace_pending_change,
    :marketplace_purchase,
    :organization_billing_email,
    :type,
    :url
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      email: {:union, [{:string, :generic}, :null]},
      id: :integer,
      login: {:string, :generic},
      marketplace_pending_change:
        {:union, [{GitHubOpenAPI.MarketplacePurchaseMarketplacePendingChange, :t}, :null]},
      marketplace_purchase: {GitHubOpenAPI.MarketplacePurchaseMarketplacePurchase, :t},
      organization_billing_email: {:string, :generic},
      type: {:string, :generic},
      url: {:string, :generic}
    ]
  end
end
