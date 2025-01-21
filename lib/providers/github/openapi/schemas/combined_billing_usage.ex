defmodule GitHubOpenAPI.CombinedBillingUsage do
  @moduledoc """
  Provides struct and type for a CombinedBillingUsage
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          days_left_in_billing_cycle: integer,
          estimated_paid_storage_for_month: integer,
          estimated_storage_for_month: integer
        }

  defstruct [
    :__info__,
    :__joins__,
    :days_left_in_billing_cycle,
    :estimated_paid_storage_for_month,
    :estimated_storage_for_month
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      days_left_in_billing_cycle: :integer,
      estimated_paid_storage_for_month: :integer,
      estimated_storage_for_month: :integer
    ]
  end
end
