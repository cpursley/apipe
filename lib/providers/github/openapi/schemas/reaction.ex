defmodule GitHubOpenAPI.Reaction do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :content, Ecto.Enum, values: [:"+1", :"-1", :laugh, :confused, :heart, :hooray, :rocket, :eyes]
    field :created_at, :string
    field :id, :integer
    field :node_id, :string
    embeds_one :user, GitHubOpenAPI.NullableSimpleUser
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:content, :created_at, :id, :node_id, :__info__, :__joins__])
        |> cast_embed(:user, with: &GitHubOpenAPI.NullableSimpleUser.changeset/2)
  end
end
