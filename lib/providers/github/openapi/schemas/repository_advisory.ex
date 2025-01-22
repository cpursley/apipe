defmodule GitHubOpenAPI.RepositoryAdvisory do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :closed_at, :string
    field :created_at, :string
    field :credits, {:array, :string}
    field :cve_id, :string
    field :cvss, :map
    field :cwe_ids, {:array, :string}
    field :cwes, {:array, :string}
    field :description, :string
    field :ghsa_id, :string
    field :html_url, :string
    field :identifiers, {:array, :string}
    field :published_at, :string
    field :severity, Ecto.Enum, values: [:critical, :high, :medium, :low]
    field :state, Ecto.Enum, values: [:published, :closed, :withdrawn, :draft, :triage]
    field :submission, :map
    field :summary, :string
    field :updated_at, :string
    field :url, :string
    field :withdrawn_at, :string
    embeds_one :author, GitHubOpenAPI.SimpleUser
    embeds_many :collaborating_teams, GitHubOpenAPI.Team
    embeds_many :collaborating_users, GitHubOpenAPI.SimpleUser
    embeds_many :credits_detailed, GitHubOpenAPI.RepositoryAdvisoryCredit
    embeds_one :cvss_severities, GitHubOpenAPI.CvssSeverities
    embeds_one :private_fork, GitHubOpenAPI.SimpleRepository
    embeds_one :publisher, GitHubOpenAPI.SimpleUser
    embeds_many :vulnerabilities, GitHubOpenAPI.RepositoryAdvisoryVulnerability
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:closed_at, :created_at, :credits, :cve_id, :cwe_ids, :cwes, :description, :ghsa_id, :html_url, :identifiers, :published_at, :severity, :state, :summary, :updated_at, :url, :withdrawn_at, :__info__, :__joins__])
        |> cast_embed(:collaborating_teams, with: &GitHubOpenAPI.Team.changeset/2)
    |> cast_embed(:collaborating_users, with: &GitHubOpenAPI.SimpleUser.changeset/2)
    |> cast_embed(:credits_detailed, with: &GitHubOpenAPI.RepositoryAdvisoryCredit.changeset/2)
    |> cast_embed(:cvss_severities, with: &GitHubOpenAPI.CvssSeverities.changeset/2)
    |> cast_embed(:vulnerabilities, with: &GitHubOpenAPI.RepositoryAdvisoryVulnerability.changeset/2)
  end
end
