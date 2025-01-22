defmodule GitHubOpenAPI.AuthenticationToken do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :expires_at, :string
    field :permissions, :map
    field :repository_selection, Ecto.Enum, values: [:all, :selected]
    field :single_file, :string
    field :token, :string
    embeds_many :repositories, GitHubOpenAPI.Repository
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:expires_at, :repository_selection, :single_file, :token, :__info__, :__joins__])
        |> cast_embed(:repositories, with: &GitHubOpenAPI.Repository.changeset/2)
  end
end
