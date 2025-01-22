defmodule GitHubOpenAPI.ProjectsV2 do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :closed_at, :string
    field :created_at, :string
    field :deleted_at, :string
    field :description, :string
    field :id, :float
    field :node_id, :string
    field :number, :integer
    field :public, :boolean
    field :short_description, :string
    field :title, :string
    field :updated_at, :string
    embeds_one :creator, GitHubOpenAPI.SimpleUser
    embeds_one :deleted_by, GitHubOpenAPI.NullableSimpleUser
    embeds_one :owner, GitHubOpenAPI.SimpleUser
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:closed_at, :created_at, :deleted_at, :description, :id, :node_id, :number, :public, :short_description, :title, :updated_at, :__info__, :__joins__])
        |> cast_embed(:creator, with: &GitHubOpenAPI.SimpleUser.changeset/2)
    |> cast_embed(:deleted_by, with: &GitHubOpenAPI.NullableSimpleUser.changeset/2)
    |> cast_embed(:owner, with: &GitHubOpenAPI.SimpleUser.changeset/2)
  end
end
