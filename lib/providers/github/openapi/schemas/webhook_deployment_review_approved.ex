defmodule GitHubOpenAPI.WebhookDeploymentReviewApproved do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :action, Ecto.Enum, values: [:approved]
    field :comment, :string
    field :since, :string
    field :workflow_job_runs, {:array, :string}
    field :workflow_run, :map
    embeds_one :approver, GitHubOpenAPI.WebhooksApprover
    embeds_one :enterprise, GitHubOpenAPI.EnterpriseWebhooks
    embeds_one :installation, GitHubOpenAPI.SimpleInstallation
    embeds_one :organization, GitHubOpenAPI.OrganizationSimpleWebhooks
    embeds_one :repository, GitHubOpenAPI.RepositoryWebhooks
    embeds_one :reviewers, GitHubOpenAPI.WebhooksReviewers
    embeds_one :sender, GitHubOpenAPI.SimpleUser
    embeds_one :workflow_job_run, GitHubOpenAPI.WebhooksWorkflowJobRun
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:action, :comment, :since, :workflow_job_runs, :__info__, :__joins__])
        |> cast_embed(:approver, with: &GitHubOpenAPI.WebhooksApprover.changeset/2)
    |> cast_embed(:enterprise, with: &GitHubOpenAPI.EnterpriseWebhooks.changeset/2)
    |> cast_embed(:installation, with: &GitHubOpenAPI.SimpleInstallation.changeset/2)
    |> cast_embed(:organization, with: &GitHubOpenAPI.OrganizationSimpleWebhooks.changeset/2)
    |> cast_embed(:repository, with: &GitHubOpenAPI.RepositoryWebhooks.changeset/2)
    |> cast_embed(:reviewers, with: &GitHubOpenAPI.WebhooksReviewers.changeset/2)
    |> cast_embed(:sender, with: &GitHubOpenAPI.SimpleUser.changeset/2)
    |> cast_embed(:workflow_job_run, with: &GitHubOpenAPI.WebhooksWorkflowJobRun.changeset/2)
  end
end
