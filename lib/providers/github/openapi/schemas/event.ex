defmodule GitHubOpenAPI.Event do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :created_at, :string
    field :id, :string
    field :payload, :map
    field :public, :boolean
    field :repo, :map
    field :type, :string
    embeds_one :actor, GitHubOpenAPI.Actor
    embeds_one :org, GitHubOpenAPI.Actor
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:created_at, :id, :public, :type, :__info__, :__joins__])
        |> cast_embed(:actor, with: &GitHubOpenAPI.Actor.changeset/2)
    |> cast_embed(:org, with: &GitHubOpenAPI.Actor.changeset/2)
  end
end
