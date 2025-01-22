defmodule GitHubOpenAPI.WebhookDiscussionUnanswered do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :action, Ecto.Enum, values: [:unanswered]
    embeds_one :discussion, GitHubOpenAPI.Discussion
    embeds_one :old_answer, GitHubOpenAPI.WebhooksAnswer
    embeds_one :organization, GitHubOpenAPI.OrganizationSimpleWebhooks
    embeds_one :repository, GitHubOpenAPI.RepositoryWebhooks
    embeds_one :sender, GitHubOpenAPI.SimpleUser
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:action, :__info__, :__joins__])
        |> cast_embed(:discussion, with: &GitHubOpenAPI.Discussion.changeset/2)
    |> cast_embed(:old_answer, with: &GitHubOpenAPI.WebhooksAnswer.changeset/2)
    |> cast_embed(:organization, with: &GitHubOpenAPI.OrganizationSimpleWebhooks.changeset/2)
    |> cast_embed(:repository, with: &GitHubOpenAPI.RepositoryWebhooks.changeset/2)
    |> cast_embed(:sender, with: &GitHubOpenAPI.SimpleUser.changeset/2)
  end
end
