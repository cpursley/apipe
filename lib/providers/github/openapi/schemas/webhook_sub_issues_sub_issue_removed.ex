defmodule GitHubOpenAPI.WebhookSubIssuesSubIssueRemoved do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :action, Ecto.Enum, values: [:sub_issue_removed]
    field :parent_issue_id, :float
    field :sub_issue_id, :float
    embeds_one :installation, GitHubOpenAPI.SimpleInstallation
    embeds_one :organization, GitHubOpenAPI.OrganizationSimpleWebhooks
    embeds_one :parent_issue, GitHubOpenAPI.Issue
    embeds_one :repository, GitHubOpenAPI.RepositoryWebhooks
    embeds_one :sender, GitHubOpenAPI.SimpleUser
    embeds_one :sub_issue, GitHubOpenAPI.Issue
    embeds_one :sub_issue_repo, GitHubOpenAPI.Repository
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:action, :parent_issue_id, :sub_issue_id, :__info__, :__joins__])
        |> cast_embed(:installation, with: &GitHubOpenAPI.SimpleInstallation.changeset/2)
    |> cast_embed(:organization, with: &GitHubOpenAPI.OrganizationSimpleWebhooks.changeset/2)
    |> cast_embed(:parent_issue, with: &GitHubOpenAPI.Issue.changeset/2)
    |> cast_embed(:repository, with: &GitHubOpenAPI.RepositoryWebhooks.changeset/2)
    |> cast_embed(:sender, with: &GitHubOpenAPI.SimpleUser.changeset/2)
    |> cast_embed(:sub_issue, with: &GitHubOpenAPI.Issue.changeset/2)
    |> cast_embed(:sub_issue_repo, with: &GitHubOpenAPI.Repository.changeset/2)
  end
end
