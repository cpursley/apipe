defmodule GitHubOpenAPI.ProjectCard do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :archived, :boolean
    field :column_name, :string
    field :column_url, :string
    field :content_url, :string
    field :created_at, :string
    field :id, :integer
    field :node_id, :string
    field :note, :string
    field :project_id, :string
    field :project_url, :string
    field :updated_at, :string
    field :url, :string
    embeds_one :creator, GitHubOpenAPI.NullableSimpleUser
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:archived, :column_name, :column_url, :content_url, :created_at, :id, :node_id, :note, :project_id, :project_url, :updated_at, :url, :__info__, :__joins__])
        |> cast_embed(:creator, with: &GitHubOpenAPI.NullableSimpleUser.changeset/2)
  end
end
