defmodule GitHubOpenAPI.ActionsGetDefaultWorkflowPermissions do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    embeds_one :can_approve_pull_request_reviews, GitHubOpenAPI.ActionsCanApprovePullRequestReviews
    embeds_one :default_workflow_permissions, GitHubOpenAPI.ActionsDefaultWorkflowPermissions
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:__info__, :__joins__])
        |> cast_embed(:can_approve_pull_request_reviews, with: &GitHubOpenAPI.ActionsCanApprovePullRequestReviews.changeset/2)
    |> cast_embed(:default_workflow_permissions, with: &GitHubOpenAPI.ActionsDefaultWorkflowPermissions.changeset/2)
  end
end
