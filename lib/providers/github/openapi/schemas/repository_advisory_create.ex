defmodule GitHubOpenAPI.RepositoryAdvisoryCreate do
  @moduledoc """
  Provides struct and type for a RepositoryAdvisoryCreate
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          credits: [map] | nil,
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
      credits: {:union, [[:map], :null]},
      cve_id: {:union, [{:string, :generic}, :null]},
      cvss_vector_string: {:union, [{:string, :generic}, :null]},
      cwe_ids: {:union, [[string: :generic], :null]},
      description: {:string, :generic},
      severity: {:enum, ["critical", "high", "medium", "low", nil]},
      start_private_fork: :boolean,
      summary: {:string, :generic},
      vulnerabilities: [{GitHubOpenAPI.RepositoryAdvisoryCreateVulnerabilities, :t}]
    ]
  end
end
