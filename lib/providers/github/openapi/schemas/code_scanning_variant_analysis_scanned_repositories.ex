defmodule GitHubOpenAPI.CodeScanningVariantAnalysisScannedRepositories do
  @moduledoc """
  Provides struct and type for a CodeScanningVariantAnalysisScannedRepositories
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          analysis_status: String.t(),
          artifact_size_in_bytes: integer | nil,
          failure_message: String.t() | nil,
          repository: GitHubOpenAPI.CodeScanningVariantAnalysisRepository.t(),
          result_count: integer | nil
        }

  defstruct [
    :__info__,
    :__joins__,
    :analysis_status,
    :artifact_size_in_bytes,
    :failure_message,
    :repository,
    :result_count
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      analysis_status:
        {:enum, ["pending", "in_progress", "succeeded", "failed", "canceled", "timed_out"]},
      artifact_size_in_bytes: :integer,
      failure_message: {:string, :generic},
      repository: {GitHubOpenAPI.CodeScanningVariantAnalysisRepository, :t},
      result_count: :integer
    ]
  end
end
