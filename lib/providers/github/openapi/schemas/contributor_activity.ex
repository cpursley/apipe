defmodule GitHubOpenAPI.ContributorActivity do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :total, :integer
    field :weeks, {:array, :string}
    embeds_one :author, GitHubOpenAPI.NullableSimpleUser
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:total, :weeks, :__info__, :__joins__])
        |> cast_embed(:author, with: &GitHubOpenAPI.NullableSimpleUser.changeset/2)
  end
end
