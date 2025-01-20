defmodule GitHubOpenAPI.ApiInsightsUserStats do
  @moduledoc """
  Provides struct and type for a ApiInsightsUserStats
  """
  use Apipe.Providers.OpenAPIEncoder

  @type t :: %__MODULE__{
          __info__: map,
          actor_id: integer | nil,
          actor_name: String.t() | nil,
          actor_type: String.t() | nil,
          integration_id: integer | nil,
          last_rate_limited_timestamp: String.t() | nil,
          last_request_timestamp: String.t() | nil,
          oauth_application_id: integer | nil,
          rate_limited_request_count: integer | nil,
          total_request_count: integer | nil
        }

  defstruct [
    :__info__,
    :actor_id,
    :actor_name,
    :actor_type,
    :integration_id,
    :last_rate_limited_timestamp,
    :last_request_timestamp,
    :oauth_application_id,
    :rate_limited_request_count,
    :total_request_count
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      actor_id: :integer,
      actor_name: {:string, :generic},
      actor_type: {:string, :generic},
      integration_id: {:union, [:integer, :null]},
      last_rate_limited_timestamp: {:union, [{:string, :generic}, :null]},
      last_request_timestamp: {:string, :generic},
      oauth_application_id: {:union, [:integer, :null]},
      rate_limited_request_count: :integer,
      total_request_count: :integer
    ]
  end
end
