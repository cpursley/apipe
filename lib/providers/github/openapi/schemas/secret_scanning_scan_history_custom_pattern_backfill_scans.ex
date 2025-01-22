defmodule GitHubOpenAPI.SecretScanningScanHistoryCustomPatternBackfillScans do
  @moduledoc """
  Provides struct and type for a SecretScanningScanHistoryCustomPatternBackfillScans
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          completed_at: DateTime.t() | nil,
          pattern_name: String.t() | nil,
          pattern_scope: String.t() | nil,
          started_at: DateTime.t() | nil,
          status: String.t() | nil,
          type: String.t() | nil
        }

  defstruct [
    :__info__,
    :__joins__,
    :completed_at,
    :pattern_name,
    :pattern_scope,
    :started_at,
    :status,
    :type
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      completed_at: {:string, :date_time},
      pattern_name: {:string, :generic},
      pattern_scope: {:string, :generic},
      started_at: {:string, :date_time},
      status: {:string, :generic},
      type: {:string, :generic}
    ]
  end
end
