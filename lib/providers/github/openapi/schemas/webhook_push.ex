defmodule GitHubOpenAPI.WebhookPush do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :after, :string
    field :before, :string
    field :commits, {:array, :string}
    field :compare, :string
    field :created, :boolean
    field :deleted, :boolean
    field :forced, :boolean
    field :head_commit, :map
    field :pusher, :map
    field :ref, :string
    field :repository, :map
    embeds_one :base_ref, GitHubOpenAPI.WebhooksNullableString
    embeds_one :enterprise, GitHubOpenAPI.EnterpriseWebhooks
    embeds_one :installation, GitHubOpenAPI.SimpleInstallation
    embeds_one :organization, GitHubOpenAPI.OrganizationSimpleWebhooks
    embeds_one :sender, GitHubOpenAPI.SimpleUser
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:after, :before, :commits, :compare, :created, :deleted, :forced, :ref, :__info__, :__joins__])
        |> cast_embed(:base_ref, with: &GitHubOpenAPI.WebhooksNullableString.changeset/2)
    |> cast_embed(:enterprise, with: &GitHubOpenAPI.EnterpriseWebhooks.changeset/2)
    |> cast_embed(:installation, with: &GitHubOpenAPI.SimpleInstallation.changeset/2)
    |> cast_embed(:organization, with: &GitHubOpenAPI.OrganizationSimpleWebhooks.changeset/2)
    |> cast_embed(:sender, with: &GitHubOpenAPI.SimpleUser.changeset/2)
  end
end
