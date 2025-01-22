defmodule GitHubOpenAPI.ReleaseAsset do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :browser_download_url, :string
    field :content_type, :string
    field :created_at, :string
    field :download_count, :integer
    field :id, :integer
    field :label, :string
    field :name, :string
    field :node_id, :string
    field :size, :integer
    field :state, Ecto.Enum, values: [:uploaded, :open]
    field :updated_at, :string
    field :url, :string
    embeds_one :uploader, GitHubOpenAPI.NullableSimpleUser
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:browser_download_url, :content_type, :created_at, :download_count, :id, :label, :name, :node_id, :size, :state, :updated_at, :url, :__info__, :__joins__])
        |> cast_embed(:uploader, with: &GitHubOpenAPI.NullableSimpleUser.changeset/2)
  end
end
