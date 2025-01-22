defmodule GitHubOpenAPI.StarredRepository do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :starred_at, :string
    embeds_one :repo, GitHubOpenAPI.Repository
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:starred_at, :__info__, :__joins__])
        |> cast_embed(:repo, with: &GitHubOpenAPI.Repository.changeset/2)
  end
end
