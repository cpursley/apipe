defmodule GitHubOpenAPI.GitTag do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :message, :string
    field :node_id, :string
    field :object, :map
    field :sha, :string
    field :tag, :string
    field :tagger, :map
    field :url, :string
    embeds_one :verification, GitHubOpenAPI.Verification
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:message, :node_id, :sha, :tag, :url, :__info__, :__joins__])
        |> cast_embed(:verification, with: &GitHubOpenAPI.Verification.changeset/2)
  end
end
