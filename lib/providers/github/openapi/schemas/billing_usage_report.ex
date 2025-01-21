defmodule GitHubOpenAPI.BillingUsageReport do
  @moduledoc """
  Provides struct and type for a BillingUsageReport
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          usageItems: [GitHubOpenAPI.BillingUsageReportUsageItems.t()] | nil
        }

  defstruct [:__info__, :__joins__, :usageItems]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [usageItems: [{GitHubOpenAPI.BillingUsageReportUsageItems, :t}]]
  end
end
