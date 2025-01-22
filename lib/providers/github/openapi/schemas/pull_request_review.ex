defmodule GitHubOpenAPI.PullRequestReview do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :_links, :map
    field :body, :string
    field :body_html, :string
    field :body_text, :string
    field :commit_id, :string
    field :html_url, :string
    field :id, :integer
    field :node_id, :string
    field :pull_request_url, :string
    field :state, :string
    field :submitted_at, :string
    embeds_one :author_association, GitHubOpenAPI.AuthorAssociation
    embeds_one :user, GitHubOpenAPI.NullableSimpleUser
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:body, :body_html, :body_text, :commit_id, :html_url, :id, :node_id, :pull_request_url, :state, :submitted_at, :__info__, :__joins__])
        |> cast_embed(:author_association, with: &GitHubOpenAPI.AuthorAssociation.changeset/2)
    |> cast_embed(:user, with: &GitHubOpenAPI.NullableSimpleUser.changeset/2)
  end
end
