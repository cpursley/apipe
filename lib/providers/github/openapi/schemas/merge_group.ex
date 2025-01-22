defmodule GitHubOpenAPI.MergeGroup do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :base_ref, :string
    field :base_sha, :string
    field :head_ref, :string
    field :head_sha, :string
    embeds_one :head_commit, GitHubOpenAPI.SimpleCommit
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:base_ref, :base_sha, :head_ref, :head_sha, :__info__, :__joins__])
        |> cast_embed(:head_commit, with: &GitHubOpenAPI.SimpleCommit.changeset/2)
  end
end
