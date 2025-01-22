defmodule GitHubOpenAPI.ProjectsV2StatusUpdate do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :body, :string
    field :created_at, :string
    field :id, :float
    field :node_id, :string
    field :project_node_id, :string
    field :start_date, :string
    field :status, Ecto.Enum, values: [:"INACTIVE", :"ON_TRACK", :"AT_RISK", :"OFF_TRACK", :"COMPLETE"]
    field :target_date, :string
    field :updated_at, :string
    embeds_one :creator, GitHubOpenAPI.SimpleUser
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:body, :created_at, :id, :node_id, :project_node_id, :start_date, :status, :target_date, :updated_at, :__info__, :__joins__])
        |> cast_embed(:creator, with: &GitHubOpenAPI.SimpleUser.changeset/2)
  end
end
