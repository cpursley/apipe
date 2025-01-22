defmodule GitHubOpenAPI.WebhookPullRequestDequeued do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :action, Ecto.Enum, values: [:dequeued]
    field :number, :integer
    field :pull_request, :map
    field :reason, Ecto.Enum, values: [:"UNKNOWN_REMOVAL_REASON", :"MANUAL", :"MERGE", :"MERGE_CONFLICT", :"CI_FAILURE", :"CI_TIMEOUT", :"ALREADY_MERGED", :"QUEUE_CLEARED", :"ROLL_BACK", :"BRANCH_PROTECTIONS", :"GIT_TREE_INVALID", :"INVALID_MERGE_COMMIT"]
    embeds_one :enterprise, GitHubOpenAPI.EnterpriseWebhooks
    embeds_one :installation, GitHubOpenAPI.SimpleInstallation
    embeds_one :organization, GitHubOpenAPI.OrganizationSimpleWebhooks
    embeds_one :repository, GitHubOpenAPI.RepositoryWebhooks
    embeds_one :sender, GitHubOpenAPI.SimpleUser
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:action, :number, :reason, :__info__, :__joins__])
        |> cast_embed(:enterprise, with: &GitHubOpenAPI.EnterpriseWebhooks.changeset/2)
    |> cast_embed(:installation, with: &GitHubOpenAPI.SimpleInstallation.changeset/2)
    |> cast_embed(:organization, with: &GitHubOpenAPI.OrganizationSimpleWebhooks.changeset/2)
    |> cast_embed(:repository, with: &GitHubOpenAPI.RepositoryWebhooks.changeset/2)
    |> cast_embed(:sender, with: &GitHubOpenAPI.SimpleUser.changeset/2)
  end
end
