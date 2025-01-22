defmodule GitHubOpenAPI.CloneTraffic do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :count, :integer
    field :uniques, :integer
    embeds_many :clones, GitHubOpenAPI.Traffic
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:count, :uniques, :__info__, :__joins__])
        |> cast_embed(:clones, with: &GitHubOpenAPI.Traffic.changeset/2)
  end
end
