defmodule GitHubOpenAPI.Release do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :assets_url, :string
    field :body, :string
    field :body_html, :string
    field :body_text, :string
    field :created_at, :string
    field :discussion_url, :string
    field :draft, :boolean
    field :html_url, :string
    field :id, :integer
    field :mentions_count, :integer
    field :name, :string
    field :node_id, :string
    field :prerelease, :boolean
    field :published_at, :string
    field :tag_name, :string
    field :tarball_url, :string
    field :target_commitish, :string
    field :upload_url, :string
    field :url, :string
    field :zipball_url, :string
    embeds_many :assets, GitHubOpenAPI.ReleaseAsset
    embeds_one :author, GitHubOpenAPI.SimpleUser
    embeds_one :reactions, GitHubOpenAPI.ReactionRollup
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:assets_url, :body, :body_html, :body_text, :created_at, :discussion_url, :draft, :html_url, :id, :mentions_count, :name, :node_id, :prerelease, :published_at, :tag_name, :tarball_url, :target_commitish, :upload_url, :url, :zipball_url, :__info__, :__joins__])
        |> cast_embed(:assets, with: &GitHubOpenAPI.ReleaseAsset.changeset/2)
    |> cast_embed(:author, with: &GitHubOpenAPI.SimpleUser.changeset/2)
    |> cast_embed(:reactions, with: &GitHubOpenAPI.ReactionRollup.changeset/2)
  end
end
