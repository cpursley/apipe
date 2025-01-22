defmodule GitHubOpenAPI.Snapshot do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :detector, {:map, :string}
    field :job, {:map, :string}
    field :ref, :string
    field :scanned, :string
    field :sha, :string
    field :version, :integer
    embeds_many :manifests, GitHubOpenAPI.Manifest
    embeds_one :metadata, GitHubOpenAPI.Metadata
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:ref, :scanned, :sha, :version, :__info__, :__joins__])
        |> cast_embed(:metadata, with: &GitHubOpenAPI.Metadata.changeset/2)
  end
end
