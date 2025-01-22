defmodule GitHubOpenAPI.WebhookPullRequestDemilestoned do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :action, Ecto.Enum, values: [:demilestoned]
    embeds_one :enterprise, GitHubOpenAPI.EnterpriseWebhooks
    embeds_one :milestone, GitHubOpenAPI.Milestone
    embeds_one :number, GitHubOpenAPI.WebhooksNumber
    embeds_one :organization, GitHubOpenAPI.OrganizationSimpleWebhooks
    embeds_one :pull_request, GitHubOpenAPI.WebhooksPullRequest5
    embeds_one :repository, GitHubOpenAPI.RepositoryWebhooks
    embeds_one :sender, GitHubOpenAPI.SimpleUser
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:action, :__info__, :__joins__])
        |> cast_embed(:enterprise, with: &GitHubOpenAPI.EnterpriseWebhooks.changeset/2)
    |> cast_embed(:milestone, with: &GitHubOpenAPI.Milestone.changeset/2)
    |> cast_embed(:number, with: &GitHubOpenAPI.WebhooksNumber.changeset/2)
    |> cast_embed(:organization, with: &GitHubOpenAPI.OrganizationSimpleWebhooks.changeset/2)
    |> cast_embed(:pull_request, with: &GitHubOpenAPI.WebhooksPullRequest5.changeset/2)
    |> cast_embed(:repository, with: &GitHubOpenAPI.RepositoryWebhooks.changeset/2)
    |> cast_embed(:sender, with: &GitHubOpenAPI.SimpleUser.changeset/2)
  end
end
