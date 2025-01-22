defmodule GitHubOpenAPI.Status do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :avatar_url, :string
    field :context, :string
    field :created_at, :string
    field :description, :string
    field :id, :integer
    field :node_id, :string
    field :state, :string
    field :target_url, :string
    field :updated_at, :string
    field :url, :string
    embeds_one :creator, GitHubOpenAPI.NullableSimpleUser
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:avatar_url, :context, :created_at, :description, :id, :node_id, :state, :target_url, :updated_at, :url, :__info__, :__joins__])
        |> cast_embed(:creator, with: &GitHubOpenAPI.NullableSimpleUser.changeset/2)
  end
end
