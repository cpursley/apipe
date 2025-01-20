defmodule GitHubOpenAPI.SecretScanningScanHistoryCustomPatternBackfillScans do
  @moduledoc """
  Provides struct and type for a SecretScanningScanHistoryCustomPatternBackfillScans
  """
  use Apipe.Providers.OpenAPIEncoder

  @type t :: %__MODULE__{
          __info__: map,
          completed_at: DateTime.t() | nil,
          pattern_name: String.t() | nil,
          pattern_scope: String.t() | nil,
          started_at: DateTime.t() | nil,
          status: String.t() | nil,
          type: String.t() | nil
        }

  defstruct [:__info__, :completed_at, :pattern_name, :pattern_scope, :started_at, :status, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      completed_at: {:union, [{:string, :date_time}, :null]},
      pattern_name: {:string, :generic},
      pattern_scope: {:string, :generic},
      started_at: {:union, [{:string, :date_time}, :null]},
      status: {:string, :generic},
      type: {:string, :generic}
    ]
  end
end
