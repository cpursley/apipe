defmodule GitHubOpenAPI.SecretScanningScanHistory do
  @moduledoc """
  Provides struct and type for a SecretScanningScanHistory
  """
  use Apipe.Providers.OpenAPIEncoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          backfill_scans: [GitHubOpenAPI.SecretScanningScan.t()] | nil,
          custom_pattern_backfill_scans:
            [GitHubOpenAPI.SecretScanningScanHistoryCustomPatternBackfillScans.t()] | nil,
          incremental_scans: [GitHubOpenAPI.SecretScanningScan.t()] | nil,
          pattern_update_scans: [GitHubOpenAPI.SecretScanningScan.t()] | nil
        }

  defstruct [
    :__info__,
    :__joins__,
    :backfill_scans,
    :custom_pattern_backfill_scans,
    :incremental_scans,
    :pattern_update_scans
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      backfill_scans: [{GitHubOpenAPI.SecretScanningScan, :t}],
      custom_pattern_backfill_scans: [
        {GitHubOpenAPI.SecretScanningScanHistoryCustomPatternBackfillScans, :t}
      ],
      incremental_scans: [{GitHubOpenAPI.SecretScanningScan, :t}],
      pattern_update_scans: [{GitHubOpenAPI.SecretScanningScan, :t}]
    ]
  end
end
