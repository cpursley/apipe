defmodule GitHubOpenAPI.Manifest do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :file, {:map, :string}
    field :name, :string
    embeds_one :metadata, GitHubOpenAPI.Metadata
    embeds_many :resolved, GitHubOpenAPI.Dependency
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:name, :__info__, :__joins__])
        |> cast_embed(:metadata, with: &GitHubOpenAPI.Metadata.changeset/2)
  end
end
