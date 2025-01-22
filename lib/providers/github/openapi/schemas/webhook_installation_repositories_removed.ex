defmodule GitHubOpenAPI.WebhookInstallationRepositoriesRemoved do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :action, Ecto.Enum, values: [:removed]
    field :repositories_removed, {:array, :string}
    embeds_one :enterprise, GitHubOpenAPI.EnterpriseWebhooks
    embeds_one :installation, GitHubOpenAPI.Installation
    embeds_one :organization, GitHubOpenAPI.OrganizationSimpleWebhooks
    embeds_one :repositories_added, GitHubOpenAPI.WebhooksRepositoriesAdded
    embeds_one :repository, GitHubOpenAPI.RepositoryWebhooks
    embeds_one :repository_selection, GitHubOpenAPI.WebhooksRepositorySelection
    embeds_one :requester, GitHubOpenAPI.WebhooksUser
    embeds_one :sender, GitHubOpenAPI.SimpleUser
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:action, :repositories_removed, :__info__, :__joins__])
        |> cast_embed(:enterprise, with: &GitHubOpenAPI.EnterpriseWebhooks.changeset/2)
    |> cast_embed(:installation, with: &GitHubOpenAPI.Installation.changeset/2)
    |> cast_embed(:organization, with: &GitHubOpenAPI.OrganizationSimpleWebhooks.changeset/2)
    |> cast_embed(:repositories_added, with: &GitHubOpenAPI.WebhooksRepositoriesAdded.changeset/2)
    |> cast_embed(:repository, with: &GitHubOpenAPI.RepositoryWebhooks.changeset/2)
    |> cast_embed(:repository_selection, with: &GitHubOpenAPI.WebhooksRepositorySelection.changeset/2)
    |> cast_embed(:requester, with: &GitHubOpenAPI.WebhooksUser.changeset/2)
    |> cast_embed(:sender, with: &GitHubOpenAPI.SimpleUser.changeset/2)
  end
end
