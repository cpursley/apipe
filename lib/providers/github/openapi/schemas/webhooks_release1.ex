defmodule GitHubOpenAPI.WebhooksRelease1 do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :assets, {:array, :string}
    field :assets_url, :string
    field :author, :map
    field :body, :string
    field :created_at, :string
    field :discussion_url, :string
    field :draft, :boolean
    field :html_url, :string
    field :id, :integer
    field :name, :string
    field :node_id, :string
    field :prerelease, :boolean
    field :published_at, :string
    field :reactions, :map
    field :tag_name, :string
    field :tarball_url, :string
    field :target_commitish, :string
    field :upload_url, :string
    field :url, :string
    field :zipball_url, :string
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:assets, :assets_url, :body, :created_at, :discussion_url, :draft, :html_url, :id, :name, :node_id, :prerelease, :published_at, :tag_name, :tarball_url, :target_commitish, :upload_url, :url, :zipball_url, :__info__, :__joins__])
    
  end
end
