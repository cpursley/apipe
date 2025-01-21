defmodule GitHubOpenAPI.ApiInsightsSubjectStats do
  @moduledoc """
  Provides struct and type for a ApiInsightsSubjectStats
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          last_rate_limited_timestamp: String.t() | nil,
          last_request_timestamp: String.t() | nil,
          rate_limited_request_count: integer | nil,
          subject_id: integer | nil,
          subject_name: String.t() | nil,
          subject_type: String.t() | nil,
          total_request_count: integer | nil
        }

  defstruct [
    :__info__,
    :__joins__,
    :last_rate_limited_timestamp,
    :last_request_timestamp,
    :rate_limited_request_count,
    :subject_id,
    :subject_name,
    :subject_type,
    :total_request_count
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      last_rate_limited_timestamp: {:union, [{:string, :generic}, :null]},
      last_request_timestamp: {:string, :generic},
      rate_limited_request_count: :integer,
      subject_id: :integer,
      subject_name: {:string, :generic},
      subject_type: {:string, :generic},
      total_request_count: :integer
    ]
  end
end
