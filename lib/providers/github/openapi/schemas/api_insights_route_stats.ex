defmodule GitHubOpenAPI.ApiInsightsRouteStats do
  @moduledoc """
  Provides struct and type for a ApiInsightsRouteStats
  """
  use Apipe.Providers.OpenAPIEncoder

  @type t :: %__MODULE__{
          __info__: map,
          api_route: String.t() | nil,
          http_method: String.t() | nil,
          last_rate_limited_timestamp: String.t() | nil,
          last_request_timestamp: String.t() | nil,
          rate_limited_request_count: integer | nil,
          total_request_count: integer | nil
        }

  defstruct [
    :__info__,
    :api_route,
    :http_method,
    :last_rate_limited_timestamp,
    :last_request_timestamp,
    :rate_limited_request_count,
    :total_request_count
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      api_route: {:string, :generic},
      http_method: {:string, :generic},
      last_rate_limited_timestamp: {:union, [{:string, :generic}, :null]},
      last_request_timestamp: {:string, :generic},
      rate_limited_request_count: :integer,
      total_request_count: :integer
    ]
  end
end
