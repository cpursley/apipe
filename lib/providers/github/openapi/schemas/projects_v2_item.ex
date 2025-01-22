defmodule GitHubOpenAPI.ProjectsV2Item do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :archived_at, :string
    field :content_node_id, :string
    field :created_at, :string
    field :id, :float
    field :node_id, :string
    field :project_node_id, :string
    field :updated_at, :string
    embeds_one :content_type, GitHubOpenAPI.ProjectsV2ItemContentType
    embeds_one :creator, GitHubOpenAPI.SimpleUser
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:archived_at, :content_node_id, :created_at, :id, :node_id, :project_node_id, :updated_at, :__info__, :__joins__])
        |> cast_embed(:content_type, with: &GitHubOpenAPI.ProjectsV2ItemContentType.changeset/2)
    |> cast_embed(:creator, with: &GitHubOpenAPI.SimpleUser.changeset/2)
  end
end
