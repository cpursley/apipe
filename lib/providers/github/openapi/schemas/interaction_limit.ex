defmodule GitHubOpenAPI.InteractionLimit do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    embeds_one :expiry, GitHubOpenAPI.InteractionExpiry
    embeds_one :limit, GitHubOpenAPI.InteractionGroup
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:__info__, :__joins__])
        |> cast_embed(:expiry, with: &GitHubOpenAPI.InteractionExpiry.changeset/2)
    |> cast_embed(:limit, with: &GitHubOpenAPI.InteractionGroup.changeset/2)
  end
end
