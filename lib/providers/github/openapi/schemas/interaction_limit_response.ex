defmodule GitHubOpenAPI.InteractionLimitResponse do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :expires_at, :string
    field :origin, :string
    embeds_one :limit, GitHubOpenAPI.InteractionGroup
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:expires_at, :origin, :__info__, :__joins__])
        |> cast_embed(:limit, with: &GitHubOpenAPI.InteractionGroup.changeset/2)
  end
end
