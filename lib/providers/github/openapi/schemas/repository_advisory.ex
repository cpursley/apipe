defmodule GitHubOpenAPI.RepositoryAdvisory do
  @moduledoc """
  Provides struct and type for a RepositoryAdvisory
  """
  use Apipe.Providers.OpenAPIEncoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          author: nil,
          closed_at: DateTime.t() | nil,
          collaborating_teams: [GitHubOpenAPI.Team.t()] | nil,
          collaborating_users: [GitHubOpenAPI.SimpleUser.t()] | nil,
          created_at: DateTime.t() | nil,
          credits: [map] | nil,
          credits_detailed: [map] | nil,
          cve_id: String.t() | nil,
          cvss: GitHubOpenAPI.RepositoryAdvisoryCvss.t() | nil,
          cvss_severities: GitHubOpenAPI.CvssSeverities.t() | nil,
          cwe_ids: [String.t()] | nil,
          cwes: [map] | nil,
          description: String.t() | nil,
          ghsa_id: String.t(),
          html_url: String.t(),
          identifiers: [GitHubOpenAPI.RepositoryAdvisoryIdentifiers.t()],
          private_fork: nil,
          published_at: DateTime.t() | nil,
          publisher: nil,
          severity: String.t() | nil,
          state: String.t(),
          submission: GitHubOpenAPI.RepositoryAdvisorySubmission.t() | nil,
          summary: String.t(),
          updated_at: DateTime.t() | nil,
          url: String.t(),
          vulnerabilities: [map] | nil,
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
      author: :null,
      closed_at: {:union, [{:string, :date_time}, :null]},
      collaborating_teams: {:union, [[{GitHubOpenAPI.Team, :t}], :null]},
      collaborating_users: {:union, [[{GitHubOpenAPI.SimpleUser, :t}], :null]},
      created_at: {:union, [{:string, :date_time}, :null]},
      credits: {:union, [[:map], :null]},
      credits_detailed: {:union, [[:map], :null]},
      cve_id: {:union, [{:string, :generic}, :null]},
      cvss: {:union, [{GitHubOpenAPI.RepositoryAdvisoryCvss, :t}, :null]},
      cvss_severities: {:union, [{GitHubOpenAPI.CvssSeverities, :t}, :null]},
      cwe_ids: {:union, [[string: :generic], :null]},
      cwes: {:union, [[:map], :null]},
      description: {:union, [{:string, :generic}, :null]},
      ghsa_id: {:string, :generic},
      html_url: {:string, :uri},
      identifiers: [{GitHubOpenAPI.RepositoryAdvisoryIdentifiers, :t}],
      private_fork: :null,
      published_at: {:union, [{:string, :date_time}, :null]},
      publisher: :null,
      severity: {:enum, ["critical", "high", "medium", "low", nil]},
      state: {:enum, ["published", "closed", "withdrawn", "draft", "triage"]},
      submission: {:union, [{GitHubOpenAPI.RepositoryAdvisorySubmission, :t}, :null]},
      summary: {:string, :generic},
      updated_at: {:union, [{:string, :date_time}, :null]},
      url: {:string, :uri},
      vulnerabilities: {:union, [[:map], :null]},
      withdrawn_at: {:union, [{:string, :date_time}, :null]}
    ]
  end
end
