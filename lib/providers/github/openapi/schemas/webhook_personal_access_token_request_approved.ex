defmodule GitHubOpenAPI.WebhookPersonalAccessTokenRequestApproved do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :action, Ecto.Enum, values: [:approved]
    embeds_one :enterprise, GitHubOpenAPI.EnterpriseWebhooks
    embeds_one :installation, GitHubOpenAPI.SimpleInstallation
    embeds_one :organization, GitHubOpenAPI.OrganizationSimpleWebhooks
    embeds_one :personal_access_token_request, GitHubOpenAPI.PersonalAccessTokenRequest
    embeds_one :sender, GitHubOpenAPI.SimpleUser
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:action, :__info__, :__joins__])
        |> cast_embed(:enterprise, with: &GitHubOpenAPI.EnterpriseWebhooks.changeset/2)
    |> cast_embed(:installation, with: &GitHubOpenAPI.SimpleInstallation.changeset/2)
    |> cast_embed(:organization, with: &GitHubOpenAPI.OrganizationSimpleWebhooks.changeset/2)
    |> cast_embed(:personal_access_token_request, with: &GitHubOpenAPI.PersonalAccessTokenRequest.changeset/2)
    |> cast_embed(:sender, with: &GitHubOpenAPI.SimpleUser.changeset/2)
  end
end
