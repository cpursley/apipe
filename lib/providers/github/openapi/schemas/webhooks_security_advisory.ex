defmodule GitHubOpenAPI.WebhooksSecurityAdvisory do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :cvss, :map
    field :cwes, {:array, :string}
    field :description, :string
    field :ghsa_id, :string
    field :identifiers, {:array, :string}
    field :published_at, :string
    field :references, {:array, :string}
    field :severity, :string
    field :summary, :string
    field :updated_at, :string
    field :vulnerabilities, {:array, :string}
    field :withdrawn_at, :string
    embeds_one :cvss_severities, GitHubOpenAPI.CvssSeverities
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:cwes, :description, :ghsa_id, :identifiers, :published_at, :references, :severity, :summary, :updated_at, :vulnerabilities, :withdrawn_at, :__info__, :__joins__])
        |> cast_embed(:cvss_severities, with: &GitHubOpenAPI.CvssSeverities.changeset/2)
  end
end
