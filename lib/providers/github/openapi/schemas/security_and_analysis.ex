defmodule GitHubOpenAPI.SecurityAndAnalysis do
  @moduledoc """
  Provides struct and type for a SecurityAndAnalysis
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          advanced_security: GitHubOpenAPI.SecurityAndAnalysisAdvancedSecurity.t() | nil,
          dependabot_security_updates:
            GitHubOpenAPI.SecurityAndAnalysisDependabotSecurityUpdates.t() | nil,
          secret_scanning: GitHubOpenAPI.SecurityAndAnalysisSecretScanning.t() | nil,
          secret_scanning_ai_detection:
            GitHubOpenAPI.SecurityAndAnalysisSecretScanningAiDetection.t() | nil,
          secret_scanning_non_provider_patterns:
            GitHubOpenAPI.SecurityAndAnalysisSecretScanningNonProviderPatterns.t() | nil,
          secret_scanning_push_protection:
            GitHubOpenAPI.SecurityAndAnalysisSecretScanningPushProtection.t() | nil
        }

  defstruct [
    :__info__,
    :__joins__,
    :advanced_security,
    :dependabot_security_updates,
    :secret_scanning,
    :secret_scanning_ai_detection,
    :secret_scanning_non_provider_patterns,
    :secret_scanning_push_protection
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      advanced_security: {GitHubOpenAPI.SecurityAndAnalysisAdvancedSecurity, :t},
      dependabot_security_updates:
        {GitHubOpenAPI.SecurityAndAnalysisDependabotSecurityUpdates, :t},
      secret_scanning: {GitHubOpenAPI.SecurityAndAnalysisSecretScanning, :t},
      secret_scanning_ai_detection:
        {GitHubOpenAPI.SecurityAndAnalysisSecretScanningAiDetection, :t},
      secret_scanning_non_provider_patterns:
        {GitHubOpenAPI.SecurityAndAnalysisSecretScanningNonProviderPatterns, :t},
      secret_scanning_push_protection:
        {GitHubOpenAPI.SecurityAndAnalysisSecretScanningPushProtection, :t}
    ]
  end
end
