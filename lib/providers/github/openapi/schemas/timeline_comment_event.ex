defmodule GitHubOpenAPI.TimelineCommentEvent do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :body, :string
    field :body_html, :string
    field :body_text, :string
    field :created_at, :string
    field :event, :string
    field :html_url, :string
    field :id, :integer
    field :issue_url, :string
    field :node_id, :string
    field :updated_at, :string
    field :url, :string
    embeds_one :actor, GitHubOpenAPI.SimpleUser
    embeds_one :author_association, GitHubOpenAPI.AuthorAssociation
    embeds_one :performed_via_github_app, GitHubOpenAPI.NullableIntegration
    embeds_one :reactions, GitHubOpenAPI.ReactionRollup
    embeds_one :user, GitHubOpenAPI.SimpleUser
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:body, :body_html, :body_text, :created_at, :event, :html_url, :id, :issue_url, :node_id, :updated_at, :url, :__info__, :__joins__])
        |> cast_embed(:actor, with: &GitHubOpenAPI.SimpleUser.changeset/2)
    |> cast_embed(:author_association, with: &GitHubOpenAPI.AuthorAssociation.changeset/2)
    |> cast_embed(:performed_via_github_app, with: &GitHubOpenAPI.NullableIntegration.changeset/2)
    |> cast_embed(:reactions, with: &GitHubOpenAPI.ReactionRollup.changeset/2)
    |> cast_embed(:user, with: &GitHubOpenAPI.SimpleUser.changeset/2)
  end
end
