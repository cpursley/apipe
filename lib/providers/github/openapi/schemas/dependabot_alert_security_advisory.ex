defmodule GitHubOpenAPI.DependabotAlertSecurityAdvisory do
  @moduledoc """
  Provides struct and type for a DependabotAlertSecurityAdvisory
  """
  use Apipe.Providers.OpenAPIEncoder

  @type t :: %__MODULE__{
          __info__: map,
          cve_id: String.t() | nil,
          cvss: GitHubOpenAPI.DependabotAlertSecurityAdvisoryCvss.t(),
          cvss_severities: GitHubOpenAPI.CvssSeverities.t() | nil,
          cwes: [GitHubOpenAPI.DependabotAlertSecurityAdvisoryCwes.t()],
          description: String.t(),
          ghsa_id: String.t(),
          identifiers: [GitHubOpenAPI.DependabotAlertSecurityAdvisoryIdentifiers.t()],
          published_at: DateTime.t(),
          references: [GitHubOpenAPI.DependabotAlertSecurityAdvisoryReferences.t()],
          severity: String.t(),
          summary: String.t(),
          updated_at: DateTime.t(),
          vulnerabilities: [GitHubOpenAPI.DependabotAlertSecurityVulnerability.t()],
          withdrawn_at: DateTime.t() | nil
        }

  defstruct [
    :__info__,
    :cve_id,
    :cvss,
    :cvss_severities,
    :cwes,
    :description,
    :ghsa_id,
    :identifiers,
    :published_at,
    :references,
    :severity,
    :summary,
    :updated_at,
    :vulnerabilities,
    :withdrawn_at
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      cve_id: {:union, [{:string, :generic}, :null]},
      cvss: {GitHubOpenAPI.DependabotAlertSecurityAdvisoryCvss, :t},
      cvss_severities: {:union, [{GitHubOpenAPI.CvssSeverities, :t}, :null]},
      cwes: [{GitHubOpenAPI.DependabotAlertSecurityAdvisoryCwes, :t}],
      description: {:string, :generic},
      ghsa_id: {:string, :generic},
      identifiers: [{GitHubOpenAPI.DependabotAlertSecurityAdvisoryIdentifiers, :t}],
      published_at: {:string, :date_time},
      references: [{GitHubOpenAPI.DependabotAlertSecurityAdvisoryReferences, :t}],
      severity: {:enum, ["low", "medium", "high", "critical"]},
      summary: {:string, :generic},
      updated_at: {:string, :date_time},
      vulnerabilities: [{GitHubOpenAPI.DependabotAlertSecurityVulnerability, :t}],
      withdrawn_at: {:union, [{:string, :date_time}, :null]}
    ]
  end
end
