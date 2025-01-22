defmodule GitHubOpenAPI.DependabotAlertSecurityAdvisory do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :cve_id, :string
    field :cvss, {:map, :string}
    field :cwes, {:array, :string}
    field :description, :string
    field :ghsa_id, :string
    field :identifiers, {:array, :string}
    field :published_at, :string
    field :references, {:array, :string}
    field :severity, Ecto.Enum, values: [:low, :medium, :high, :critical]
    field :summary, :string
    field :updated_at, :string
    field :withdrawn_at, :string
    embeds_one :cvss_severities, GitHubOpenAPI.CvssSeverities
    embeds_many :vulnerabilities, GitHubOpenAPI.DependabotAlertSecurityVulnerability
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:cve_id, :cwes, :description, :ghsa_id, :identifiers, :published_at, :references, :severity, :summary, :updated_at, :withdrawn_at, :__info__, :__joins__])
        |> cast_embed(:cvss_severities, with: &GitHubOpenAPI.CvssSeverities.changeset/2)
    |> cast_embed(:vulnerabilities, with: &GitHubOpenAPI.DependabotAlertSecurityVulnerability.changeset/2)
  end
end
