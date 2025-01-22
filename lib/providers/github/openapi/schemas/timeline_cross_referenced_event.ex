defmodule GitHubOpenAPI.TimelineCrossReferencedEvent do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :created_at, :string
    field :event, :string
    field :source, :map
    field :updated_at, :string
    embeds_one :actor, GitHubOpenAPI.SimpleUser
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:created_at, :event, :updated_at, :__info__, :__joins__])
        |> cast_embed(:actor, with: &GitHubOpenAPI.SimpleUser.changeset/2)
  end
end
