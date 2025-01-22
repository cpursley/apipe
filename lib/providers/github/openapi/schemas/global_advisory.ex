defmodule GitHubOpenAPI.GlobalAdvisory do
  @moduledoc """
  Provides struct and type for a GlobalAdvisory
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          credits: [GitHubOpenAPI.GlobalAdvisoryCredits.t()] | nil,
          cve_id: String.t() | nil,
          cvss: GitHubOpenAPI.GlobalAdvisoryCvss.t() | nil,
          cvss_severities: GitHubOpenAPI.CvssSeverities.t() | nil,
          cwes: [GitHubOpenAPI.GlobalAdvisoryCwes.t()] | nil,
          description: String.t() | nil,
          epss: GitHubOpenAPI.GlobalAdvisoryEpss.t() | nil,
          ghsa_id: String.t(),
          github_reviewed_at: DateTime.t() | nil,
          html_url: String.t(),
          identifiers: [GitHubOpenAPI.GlobalAdvisoryIdentifiers.t()] | nil,
          nvd_published_at: DateTime.t() | nil,
          published_at: DateTime.t(),
          references: [String.t()] | nil,
          repository_advisory_url: String.t() | nil,
          severity: String.t(),
          source_code_location: String.t() | nil,
          summary: String.t(),
          type: String.t(),
          updated_at: DateTime.t(),
          url: String.t(),
          vulnerabilities: [GitHubOpenAPI.Vulnerability.t()] | nil,
          withdrawn_at: DateTime.t() | nil
        }

  defstruct [
    :__info__,
    :__joins__,
    :credits,
    :cve_id,
    :cvss,
    :cvss_severities,
    :cwes,
    :description,
    :epss,
    :ghsa_id,
    :github_reviewed_at,
    :html_url,
    :identifiers,
    :nvd_published_at,
    :published_at,
    :references,
    :repository_advisory_url,
    :severity,
    :source_code_location,
    :summary,
    :type,
    :updated_at,
    :url,
    :vulnerabilities,
    :withdrawn_at
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      credits: [{GitHubOpenAPI.GlobalAdvisoryCredits, :t}],
      cve_id: {:string, :generic},
      cvss: {GitHubOpenAPI.GlobalAdvisoryCvss, :t},
      cvss_severities: {GitHubOpenAPI.CvssSeverities, :t},
      cwes: [{GitHubOpenAPI.GlobalAdvisoryCwes, :t}],
      description: {:string, :generic},
      epss: {GitHubOpenAPI.GlobalAdvisoryEpss, :t},
      ghsa_id: {:string, :generic},
      github_reviewed_at: {:string, :date_time},
      html_url: {:string, :uri},
      identifiers: [{GitHubOpenAPI.GlobalAdvisoryIdentifiers, :t}],
      nvd_published_at: {:string, :date_time},
      published_at: {:string, :date_time},
      references: [string: :generic],
      repository_advisory_url: {:string, :uri},
      severity: {:enum, ["critical", "high", "medium", "low", "unknown"]},
      source_code_location: {:string, :uri},
      summary: {:string, :generic},
      type: {:enum, ["reviewed", "unreviewed", "malware"]},
      updated_at: {:string, :date_time},
      url: {:string, :generic},
      vulnerabilities: [{GitHubOpenAPI.Vulnerability, :t}],
      withdrawn_at: {:string, :date_time}
    ]
  end
end
