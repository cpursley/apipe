defmodule GitHubOpenAPI.WebhookDeploymentProtectionRuleRequested do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :action, Ecto.Enum, values: [:requested]
    field :deployment_callback_url, :string
    field :environment, :string
    field :event, :string
    embeds_one :deployment, GitHubOpenAPI.Deployment
    embeds_one :installation, GitHubOpenAPI.SimpleInstallation
    embeds_one :organization, GitHubOpenAPI.OrganizationSimpleWebhooks
    embeds_many :pull_requests, GitHubOpenAPI.PullRequest
    embeds_one :repository, GitHubOpenAPI.RepositoryWebhooks
    embeds_one :sender, GitHubOpenAPI.SimpleUser
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:action, :deployment_callback_url, :environment, :event, :__info__, :__joins__])
        |> cast_embed(:deployment, with: &GitHubOpenAPI.Deployment.changeset/2)
    |> cast_embed(:installation, with: &GitHubOpenAPI.SimpleInstallation.changeset/2)
    |> cast_embed(:organization, with: &GitHubOpenAPI.OrganizationSimpleWebhooks.changeset/2)
    |> cast_embed(:pull_requests, with: &GitHubOpenAPI.PullRequest.changeset/2)
    |> cast_embed(:repository, with: &GitHubOpenAPI.RepositoryWebhooks.changeset/2)
    |> cast_embed(:sender, with: &GitHubOpenAPI.SimpleUser.changeset/2)
  end
end
