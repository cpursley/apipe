defmodule GitHubOpenAPI.ApiInsightsSummaryStats do
  @moduledoc """
  Provides struct and type for a ApiInsightsSummaryStats
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          rate_limited_request_count: integer | nil,
          total_request_count: integer | nil
        }

  defstruct [:__info__, :__joins__, :rate_limited_request_count, :total_request_count]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [rate_limited_request_count: :integer, total_request_count: :integer]
  end
end
