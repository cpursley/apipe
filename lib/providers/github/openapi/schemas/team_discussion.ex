defmodule GitHubOpenAPI.TeamDiscussion do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :body, :string
    field :body_html, :string
    field :body_version, :string
    field :comments_count, :integer
    field :comments_url, :string
    field :created_at, :string
    field :html_url, :string
    field :last_edited_at, :string
    field :node_id, :string
    field :number, :integer
    field :pinned, :boolean
    field :private, :boolean
    field :team_url, :string
    field :title, :string
    field :updated_at, :string
    field :url, :string
    embeds_one :author, GitHubOpenAPI.NullableSimpleUser
    embeds_one :reactions, GitHubOpenAPI.ReactionRollup
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:body, :body_html, :body_version, :comments_count, :comments_url, :created_at, :html_url, :last_edited_at, :node_id, :number, :pinned, :private, :team_url, :title, :updated_at, :url, :__info__, :__joins__])
        |> cast_embed(:author, with: &GitHubOpenAPI.NullableSimpleUser.changeset/2)
    |> cast_embed(:reactions, with: &GitHubOpenAPI.ReactionRollup.changeset/2)
  end
end
