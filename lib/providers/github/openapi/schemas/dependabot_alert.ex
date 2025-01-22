defmodule GitHubOpenAPI.DependabotAlert do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :dependency, :map
    field :dismissed_comment, :string
    field :dismissed_reason, Ecto.Enum, values: [:fix_started, :inaccurate, :no_bandwidth, :not_used, :tolerable_risk]
    field :state, Ecto.Enum, values: [:auto_dismissed, :dismissed, :fixed, :open]
    embeds_one :auto_dismissed_at, GitHubOpenAPI.AlertAutoDismissedAt
    embeds_one :created_at, GitHubOpenAPI.AlertCreatedAt
    embeds_one :dismissed_at, GitHubOpenAPI.AlertDismissedAt
    embeds_one :dismissed_by, GitHubOpenAPI.NullableSimpleUser
    embeds_one :fixed_at, GitHubOpenAPI.AlertFixedAt
    embeds_one :html_url, GitHubOpenAPI.AlertHtmlUrl
    embeds_one :number, GitHubOpenAPI.AlertNumber
    embeds_one :security_advisory, GitHubOpenAPI.DependabotAlertSecurityAdvisory
    embeds_one :security_vulnerability, GitHubOpenAPI.DependabotAlertSecurityVulnerability
    embeds_one :updated_at, GitHubOpenAPI.AlertUpdatedAt
    embeds_one :url, GitHubOpenAPI.AlertUrl
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:dismissed_comment, :dismissed_reason, :state, :__info__, :__joins__])
        |> cast_embed(:auto_dismissed_at, with: &GitHubOpenAPI.AlertAutoDismissedAt.changeset/2)
    |> cast_embed(:created_at, with: &GitHubOpenAPI.AlertCreatedAt.changeset/2)
    |> cast_embed(:dismissed_at, with: &GitHubOpenAPI.AlertDismissedAt.changeset/2)
    |> cast_embed(:dismissed_by, with: &GitHubOpenAPI.NullableSimpleUser.changeset/2)
    |> cast_embed(:fixed_at, with: &GitHubOpenAPI.AlertFixedAt.changeset/2)
    |> cast_embed(:html_url, with: &GitHubOpenAPI.AlertHtmlUrl.changeset/2)
    |> cast_embed(:number, with: &GitHubOpenAPI.AlertNumber.changeset/2)
    |> cast_embed(:security_advisory, with: &GitHubOpenAPI.DependabotAlertSecurityAdvisory.changeset/2)
    |> cast_embed(:security_vulnerability, with: &GitHubOpenAPI.DependabotAlertSecurityVulnerability.changeset/2)
    |> cast_embed(:updated_at, with: &GitHubOpenAPI.AlertUpdatedAt.changeset/2)
    |> cast_embed(:url, with: &GitHubOpenAPI.AlertUrl.changeset/2)
  end
end
