defmodule GitHubOpenAPI.WebhookMarketplacePurchaseChanged do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :action, Ecto.Enum, values: [:changed]
    field :effective_date, :string
    field :previous_marketplace_purchase, :map
    embeds_one :enterprise, GitHubOpenAPI.EnterpriseWebhooks
    embeds_one :installation, GitHubOpenAPI.SimpleInstallation
    embeds_one :marketplace_purchase, GitHubOpenAPI.WebhooksMarketplacePurchase
    embeds_one :organization, GitHubOpenAPI.OrganizationSimpleWebhooks
    embeds_one :repository, GitHubOpenAPI.RepositoryWebhooks
    embeds_one :sender, GitHubOpenAPI.SimpleUser
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:action, :effective_date, :__info__, :__joins__])
        |> cast_embed(:enterprise, with: &GitHubOpenAPI.EnterpriseWebhooks.changeset/2)
    |> cast_embed(:installation, with: &GitHubOpenAPI.SimpleInstallation.changeset/2)
    |> cast_embed(:marketplace_purchase, with: &GitHubOpenAPI.WebhooksMarketplacePurchase.changeset/2)
    |> cast_embed(:organization, with: &GitHubOpenAPI.OrganizationSimpleWebhooks.changeset/2)
    |> cast_embed(:repository, with: &GitHubOpenAPI.RepositoryWebhooks.changeset/2)
    |> cast_embed(:sender, with: &GitHubOpenAPI.SimpleUser.changeset/2)
  end
end
