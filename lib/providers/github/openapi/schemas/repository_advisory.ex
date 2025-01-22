defmodule GitHubOpenAPI.RepositoryAdvisory do
  @moduledoc """
  Provides struct and type for a RepositoryAdvisory
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          author: GitHubOpenAPI.RepositoryAdvisoryAuthor.t() | nil,
          closed_at: DateTime.t() | nil,
          collaborating_teams: [GitHubOpenAPI.Team.t()] | nil,
          collaborating_users: [GitHubOpenAPI.SimpleUser.t()] | nil,
          created_at: DateTime.t() | nil,
          credits: [GitHubOpenAPI.RepositoryAdvisoryCredits.t()] | nil,
          credits_detailed: [GitHubOpenAPI.RepositoryAdvisoryCredit.t()] | nil,
          cve_id: String.t() | nil,
          cvss: GitHubOpenAPI.RepositoryAdvisoryCvss.t() | nil,
          cvss_severities: GitHubOpenAPI.CvssSeverities.t() | nil,
          cwe_ids: [String.t()] | nil,
          cwes: [GitHubOpenAPI.RepositoryAdvisoryCwes.t()] | nil,
          description: String.t() | nil,
          ghsa_id: String.t(),
          html_url: String.t(),
          identifiers: [GitHubOpenAPI.RepositoryAdvisoryIdentifiers.t()],
          private_fork: GitHubOpenAPI.RepositoryAdvisoryPrivateFork.t() | nil,
          published_at: DateTime.t() | nil,
          publisher: GitHubOpenAPI.RepositoryAdvisoryPublisher.t() | nil,
          severity: String.t() | nil,
          state: String.t(),
          submission: GitHubOpenAPI.RepositoryAdvisorySubmission.t() | nil,
          summary: String.t(),
          updated_at: DateTime.t() | nil,
          url: String.t(),
          vulnerabilities: [GitHubOpenAPI.RepositoryAdvisoryVulnerability.t()] | nil,
          withdrawn_at: DateTime.t() | nil
        }

  defstruct [
    :__info__,
    :__joins__,
    :author,
    :closed_at,
    :collaborating_teams,
    :collaborating_users,
    :created_at,
    :credits,
    :credits_detailed,
    :cve_id,
    :cvss,
    :cvss_severities,
    :cwe_ids,
    :cwes,
    :description,
    :ghsa_id,
    :html_url,
    :identifiers,
    :private_fork,
    :published_at,
    :publisher,
    :severity,
    :state,
    :submission,
    :summary,
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
      author: {GitHubOpenAPI.RepositoryAdvisoryAuthor, :t},
      closed_at: {:string, :date_time},
      collaborating_teams: [{GitHubOpenAPI.Team, :t}],
      collaborating_users: [{GitHubOpenAPI.SimpleUser, :t}],
      created_at: {:string, :date_time},
      credits: [{GitHubOpenAPI.RepositoryAdvisoryCredits, :t}],
      credits_detailed: [{GitHubOpenAPI.RepositoryAdvisoryCredit, :t}],
      cve_id: {:string, :generic},
      cvss: {GitHubOpenAPI.RepositoryAdvisoryCvss, :t},
      cvss_severities: {GitHubOpenAPI.CvssSeverities, :t},
      cwe_ids: [string: :generic],
      cwes: [{GitHubOpenAPI.RepositoryAdvisoryCwes, :t}],
      description: {:string, :generic},
      ghsa_id: {:string, :generic},
      html_url: {:string, :uri},
      identifiers: [{GitHubOpenAPI.RepositoryAdvisoryIdentifiers, :t}],
      private_fork: {GitHubOpenAPI.RepositoryAdvisoryPrivateFork, :t},
      published_at: {:string, :date_time},
      publisher: {GitHubOpenAPI.RepositoryAdvisoryPublisher, :t},
      severity: {:enum, ["critical", "high", "medium", "low"]},
      state: {:enum, ["published", "closed", "withdrawn", "draft", "triage"]},
      submission: {GitHubOpenAPI.RepositoryAdvisorySubmission, :t},
      summary: {:string, :generic},
      updated_at: {:string, :date_time},
      url: {:string, :uri},
      vulnerabilities: [{GitHubOpenAPI.RepositoryAdvisoryVulnerability, :t}],
      withdrawn_at: {:string, :date_time}
    ]
  end
end
