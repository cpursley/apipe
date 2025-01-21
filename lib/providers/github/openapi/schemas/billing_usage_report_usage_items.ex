defmodule GitHubOpenAPI.BillingUsageReportUsageItems do
  @moduledoc """
  Provides struct and type for a BillingUsageReportUsageItems
  """
  use Apipe.Providers.OpenAPIEncoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          date: String.t(),
          discountAmount: number,
          grossAmount: number,
          netAmount: number,
          organizationName: String.t(),
          pricePerUnit: number,
          product: String.t(),
          quantity: integer,
          repositoryName: String.t() | nil,
          sku: String.t(),
          unitType: String.t()
        }

  defstruct [
    :__info__,
    :__joins__,
    :date,
    :discountAmount,
    :grossAmount,
    :netAmount,
    :organizationName,
    :pricePerUnit,
    :product,
    :quantity,
    :repositoryName,
    :sku,
    :unitType
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      date: {:string, :generic},
      discountAmount: :number,
      grossAmount: :number,
      netAmount: :number,
      organizationName: {:string, :generic},
      pricePerUnit: :number,
      product: {:string, :generic},
      quantity: :integer,
      repositoryName: {:string, :generic},
      sku: {:string, :generic},
      unitType: {:string, :generic}
    ]
  end
end
