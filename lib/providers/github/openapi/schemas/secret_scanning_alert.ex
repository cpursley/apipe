defmodule GitHubOpenAPI.SecretScanningAlert do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :locations_url, :string
    field :multi_repo, :boolean
    field :publicly_leaked, :boolean
    field :push_protection_bypass_request_comment, :string
    field :push_protection_bypass_request_html_url, :string
    field :push_protection_bypass_request_reviewer_comment, :string
    field :push_protection_bypassed, :boolean
    field :push_protection_bypassed_at, :string
    field :resolution_comment, :string
    field :resolved_at, :string
    field :secret, :string
    field :secret_type, :string
    field :secret_type_display_name, :string
    field :validity, Ecto.Enum, values: [:active, :inactive, :unknown]
    embeds_one :created_at, GitHubOpenAPI.AlertCreatedAt
    embeds_one :html_url, GitHubOpenAPI.AlertHtmlUrl
    embeds_one :number, GitHubOpenAPI.AlertNumber
    embeds_one :push_protection_bypass_request_reviewer, GitHubOpenAPI.NullableSimpleUser
    embeds_one :push_protection_bypassed_by, GitHubOpenAPI.NullableSimpleUser
    embeds_one :resolution, GitHubOpenAPI.SecretScanningAlertResolution
    embeds_one :resolved_by, GitHubOpenAPI.NullableSimpleUser
    embeds_one :state, GitHubOpenAPI.SecretScanningAlertState
    embeds_one :updated_at, GitHubOpenAPI.NullableAlertUpdatedAt
    embeds_one :url, GitHubOpenAPI.AlertUrl
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:locations_url, :multi_repo, :publicly_leaked, :push_protection_bypass_request_comment, :push_protection_bypass_request_html_url, :push_protection_bypass_request_reviewer_comment, :push_protection_bypassed, :push_protection_bypassed_at, :resolution_comment, :resolved_at, :secret, :secret_type, :secret_type_display_name, :validity, :__info__, :__joins__])
        |> cast_embed(:created_at, with: &GitHubOpenAPI.AlertCreatedAt.changeset/2)
    |> cast_embed(:html_url, with: &GitHubOpenAPI.AlertHtmlUrl.changeset/2)
    |> cast_embed(:number, with: &GitHubOpenAPI.AlertNumber.changeset/2)
    |> cast_embed(:push_protection_bypass_request_reviewer, with: &GitHubOpenAPI.NullableSimpleUser.changeset/2)
    |> cast_embed(:push_protection_bypassed_by, with: &GitHubOpenAPI.NullableSimpleUser.changeset/2)
    |> cast_embed(:resolution, with: &GitHubOpenAPI.SecretScanningAlertResolution.changeset/2)
    |> cast_embed(:resolved_by, with: &GitHubOpenAPI.NullableSimpleUser.changeset/2)
    |> cast_embed(:state, with: &GitHubOpenAPI.SecretScanningAlertState.changeset/2)
    |> cast_embed(:updated_at, with: &GitHubOpenAPI.NullableAlertUpdatedAt.changeset/2)
    |> cast_embed(:url, with: &GitHubOpenAPI.AlertUrl.changeset/2)
  end
end
