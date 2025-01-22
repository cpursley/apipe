defmodule GitHubOpenAPI.TeamProject do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :body, :string
    field :columns_url, :string
    field :created_at, :string
    field :html_url, :string
    field :id, :integer
    field :name, :string
    field :node_id, :string
    field :number, :integer
    field :organization_permission, :string
    field :owner_url, :string
    field :permissions, :map
    field :private, :boolean
    field :state, :string
    field :updated_at, :string
    field :url, :string
    embeds_one :creator, GitHubOpenAPI.SimpleUser
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:body, :columns_url, :created_at, :html_url, :id, :name, :node_id, :number, :organization_permission, :owner_url, :private, :state, :updated_at, :url, :__info__, :__joins__])
        |> cast_embed(:creator, with: &GitHubOpenAPI.SimpleUser.changeset/2)
  end
end
