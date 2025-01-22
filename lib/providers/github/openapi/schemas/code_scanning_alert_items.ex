defmodule GitHubOpenAPI.CodeScanningAlertItems do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    embeds_one :created_at, GitHubOpenAPI.AlertCreatedAt
    embeds_one :dismissed_at, GitHubOpenAPI.AlertDismissedAt
    embeds_one :dismissed_by, GitHubOpenAPI.NullableSimpleUser
    embeds_one :dismissed_comment, GitHubOpenAPI.CodeScanningAlertDismissedComment
    embeds_one :dismissed_reason, GitHubOpenAPI.CodeScanningAlertDismissedReason
    embeds_one :fixed_at, GitHubOpenAPI.AlertFixedAt
    embeds_one :html_url, GitHubOpenAPI.AlertHtmlUrl
    embeds_one :instances_url, GitHubOpenAPI.AlertInstancesUrl
    embeds_one :most_recent_instance, GitHubOpenAPI.CodeScanningAlertInstance
    embeds_one :number, GitHubOpenAPI.AlertNumber
    embeds_one :rule, GitHubOpenAPI.CodeScanningAlertRuleSummary
    embeds_one :state, GitHubOpenAPI.CodeScanningAlertState
    embeds_one :tool, GitHubOpenAPI.CodeScanningAnalysisTool
    embeds_one :updated_at, GitHubOpenAPI.AlertUpdatedAt
    embeds_one :url, GitHubOpenAPI.AlertUrl
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:__info__, :__joins__])
        |> cast_embed(:created_at, with: &GitHubOpenAPI.AlertCreatedAt.changeset/2)
    |> cast_embed(:dismissed_at, with: &GitHubOpenAPI.AlertDismissedAt.changeset/2)
    |> cast_embed(:dismissed_by, with: &GitHubOpenAPI.NullableSimpleUser.changeset/2)
    |> cast_embed(:dismissed_comment, with: &GitHubOpenAPI.CodeScanningAlertDismissedComment.changeset/2)
    |> cast_embed(:dismissed_reason, with: &GitHubOpenAPI.CodeScanningAlertDismissedReason.changeset/2)
    |> cast_embed(:fixed_at, with: &GitHubOpenAPI.AlertFixedAt.changeset/2)
    |> cast_embed(:html_url, with: &GitHubOpenAPI.AlertHtmlUrl.changeset/2)
    |> cast_embed(:instances_url, with: &GitHubOpenAPI.AlertInstancesUrl.changeset/2)
    |> cast_embed(:most_recent_instance, with: &GitHubOpenAPI.CodeScanningAlertInstance.changeset/2)
    |> cast_embed(:number, with: &GitHubOpenAPI.AlertNumber.changeset/2)
    |> cast_embed(:rule, with: &GitHubOpenAPI.CodeScanningAlertRuleSummary.changeset/2)
    |> cast_embed(:state, with: &GitHubOpenAPI.CodeScanningAlertState.changeset/2)
    |> cast_embed(:tool, with: &GitHubOpenAPI.CodeScanningAnalysisTool.changeset/2)
    |> cast_embed(:updated_at, with: &GitHubOpenAPI.AlertUpdatedAt.changeset/2)
    |> cast_embed(:url, with: &GitHubOpenAPI.AlertUrl.changeset/2)
  end
end
