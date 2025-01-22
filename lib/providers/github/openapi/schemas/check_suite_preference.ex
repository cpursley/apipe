defmodule GitHubOpenAPI.CheckSuitePreference do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :preferences, :map
    embeds_one :repository, GitHubOpenAPI.MinimalRepository
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:__info__, :__joins__])
        |> cast_embed(:repository, with: &GitHubOpenAPI.MinimalRepository.changeset/2)
  end
end
