defmodule GitHubOpenAPI.GlobalAdvisory do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :credits, {:array, :string}
    field :cve_id, :string
    field :cvss, :map
    field :cwes, {:array, :string}
    field :description, :string
    field :epss, :map
    field :ghsa_id, :string
    field :github_reviewed_at, :string
    field :html_url, :string
    field :identifiers, {:array, :string}
    field :nvd_published_at, :string
    field :published_at, :string
    field :references, {:array, :string}
    field :repository_advisory_url, :string
    field :severity, Ecto.Enum, values: [:critical, :high, :medium, :low, :unknown]
    field :source_code_location, :string
    field :summary, :string
    field :type, Ecto.Enum, values: [:reviewed, :unreviewed, :malware]
    field :updated_at, :string
    field :url, :string
    field :withdrawn_at, :string
    embeds_one :cvss_severities, GitHubOpenAPI.CvssSeverities
    embeds_many :vulnerabilities, GitHubOpenAPI.Vulnerability
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:credits, :cve_id, :cwes, :description, :ghsa_id, :github_reviewed_at, :html_url, :identifiers, :nvd_published_at, :published_at, :references, :repository_advisory_url, :severity, :source_code_location, :summary, :type, :updated_at, :url, :withdrawn_at, :__info__, :__joins__])
        |> cast_embed(:cvss_severities, with: &GitHubOpenAPI.CvssSeverities.changeset/2)
    |> cast_embed(:vulnerabilities, with: &GitHubOpenAPI.Vulnerability.changeset/2)
  end
end
