defmodule GitHubOpenAPI.WebhookPing do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :hook, :map
    field :hook_id, :integer
    field :zen, :string
    embeds_one :organization, GitHubOpenAPI.OrganizationSimpleWebhooks
    embeds_one :repository, GitHubOpenAPI.RepositoryWebhooks
    embeds_one :sender, GitHubOpenAPI.SimpleUser
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:hook_id, :zen, :__info__, :__joins__])
        |> cast_embed(:organization, with: &GitHubOpenAPI.OrganizationSimpleWebhooks.changeset/2)
    |> cast_embed(:repository, with: &GitHubOpenAPI.RepositoryWebhooks.changeset/2)
    |> cast_embed(:sender, with: &GitHubOpenAPI.SimpleUser.changeset/2)
  end
end
