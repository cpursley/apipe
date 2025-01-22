defmodule GitHubOpenAPI.CodeSecurityConfigurationForRepository do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :status, Ecto.Enum, values: [:attached, :attaching, :detached, :removed, :enforced, :failed, :updating, :removed_by_enterprise]
    embeds_one :configuration, GitHubOpenAPI.CodeSecurityConfiguration
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:status, :__info__, :__joins__])
        |> cast_embed(:configuration, with: &GitHubOpenAPI.CodeSecurityConfiguration.changeset/2)
  end
end
