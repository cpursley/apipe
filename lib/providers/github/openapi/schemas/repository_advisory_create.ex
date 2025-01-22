defmodule GitHubOpenAPI.RepositoryAdvisoryCreate do
  @moduledoc """
  Provides struct and type for a RepositoryAdvisoryCreate
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          credits: [GitHubOpenAPI.RepositoryAdvisoryCreateCredits.t()] | nil,
          cve_id: String.t() | nil,
          cvss_vector_string: String.t() | nil,
          cwe_ids: [String.t()] | nil,
          description: String.t(),
          severity: String.t() | nil,
          start_private_fork: boolean | nil,
          summary: String.t(),
          vulnerabilities: [GitHubOpenAPI.RepositoryAdvisoryCreateVulnerabilities.t()]
        }

  defstruct [
    :__info__,
    :__joins__,
    :credits,
    :cve_id,
    :cvss_vector_string,
    :cwe_ids,
    :description,
    :severity,
    :start_private_fork,
    :summary,
    :vulnerabilities
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      credits: [{GitHubOpenAPI.RepositoryAdvisoryCreateCredits, :t}],
      cve_id: {:string, :generic},
      cvss_vector_string: {:string, :generic},
      cwe_ids: [string: :generic],
      description: {:string, :generic},
      severity: {:enum, ["critical", "high", "medium", "low"]},
      start_private_fork: :boolean,
      summary: {:string, :generic},
      vulnerabilities: [{GitHubOpenAPI.RepositoryAdvisoryCreateVulnerabilities, :t}]
    ]
  end
end
