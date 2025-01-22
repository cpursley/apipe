defmodule GitHubOpenAPI.Dependency do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :dependencies, {:array, :string}
    field :package_url, :string
    field :relationship, Ecto.Enum, values: [:direct, :indirect]
    field :scope, Ecto.Enum, values: [:runtime, :development]
    embeds_one :metadata, GitHubOpenAPI.Metadata
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:dependencies, :package_url, :relationship, :scope, :__info__, :__joins__])
        |> cast_embed(:metadata, with: &GitHubOpenAPI.Metadata.changeset/2)
  end
end
