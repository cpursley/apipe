defmodule GitHubOpenAPI.Migration do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :archive_url, :string
    field :created_at, :string
    field :exclude, {:array, :string}
    field :exclude_attachments, :boolean
    field :exclude_git_data, :boolean
    field :exclude_metadata, :boolean
    field :exclude_owner_projects, :boolean
    field :exclude_releases, :boolean
    field :guid, :string
    field :id, :integer
    field :lock_repositories, :boolean
    field :node_id, :string
    field :org_metadata_only, :boolean
    field :state, :string
    field :updated_at, :string
    field :url, :string
    embeds_one :owner, GitHubOpenAPI.NullableSimpleUser
    embeds_many :repositories, GitHubOpenAPI.Repository
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:archive_url, :created_at, :exclude, :exclude_attachments, :exclude_git_data, :exclude_metadata, :exclude_owner_projects, :exclude_releases, :guid, :id, :lock_repositories, :node_id, :org_metadata_only, :state, :updated_at, :url, :__info__, :__joins__])
        |> cast_embed(:owner, with: &GitHubOpenAPI.NullableSimpleUser.changeset/2)
    |> cast_embed(:repositories, with: &GitHubOpenAPI.Repository.changeset/2)
  end
end
