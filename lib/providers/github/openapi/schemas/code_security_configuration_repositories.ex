defmodule GitHubOpenAPI.CodeSecurityConfigurationRepositories do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :status, Ecto.Enum, values: [:attached, :attaching, :detached, :removed, :enforced, :failed, :updating, :removed_by_enterprise]
    embeds_one :repository, GitHubOpenAPI.SimpleRepository
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:status, :__info__, :__joins__])
        |> cast_embed(:repository, with: &GitHubOpenAPI.SimpleRepository.changeset/2)
  end
end
