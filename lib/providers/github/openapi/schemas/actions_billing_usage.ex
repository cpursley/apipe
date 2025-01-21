defmodule GitHubOpenAPI.ActionsBillingUsage do
  @moduledoc """
  Provides struct and type for a ActionsBillingUsage
  """
  use Apipe.Providers.OpenAPIEncoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          included_minutes: integer,
          minutes_used_breakdown: GitHubOpenAPI.ActionsBillingUsageMinutesUsedBreakdown.t(),
          total_minutes_used: integer,
          total_paid_minutes_used: integer
        }

  defstruct [
    :__info__,
    :__joins__,
    :included_minutes,
    :minutes_used_breakdown,
    :total_minutes_used,
    :total_paid_minutes_used
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      included_minutes: :integer,
      minutes_used_breakdown: {GitHubOpenAPI.ActionsBillingUsageMinutesUsedBreakdown, :t},
      total_minutes_used: :integer,
      total_paid_minutes_used: :integer
    ]
  end
end
