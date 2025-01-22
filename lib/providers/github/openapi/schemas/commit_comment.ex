defmodule GitHubOpenAPI.CommitComment do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :body, :string
    field :commit_id, :string
    field :created_at, :string
    field :html_url, :string
    field :id, :integer
    field :line, :integer
    field :node_id, :string
    field :path, :string
    field :position, :integer
    field :updated_at, :string
    field :url, :string
    embeds_one :author_association, GitHubOpenAPI.AuthorAssociation
    embeds_one :reactions, GitHubOpenAPI.ReactionRollup
    embeds_one :user, GitHubOpenAPI.NullableSimpleUser
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:body, :commit_id, :created_at, :html_url, :id, :line, :node_id, :path, :position, :updated_at, :url, :__info__, :__joins__])
        |> cast_embed(:author_association, with: &GitHubOpenAPI.AuthorAssociation.changeset/2)
    |> cast_embed(:reactions, with: &GitHubOpenAPI.ReactionRollup.changeset/2)
    |> cast_embed(:user, with: &GitHubOpenAPI.NullableSimpleUser.changeset/2)
  end
end
