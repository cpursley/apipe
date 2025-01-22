defmodule GitHubOpenAPI.Commit do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :author, :map
    field :comments_url, :string
    field :commit, :map
    field :committer, :map
    field :html_url, :string
    field :node_id, :string
    field :parents, {:array, :string}
    field :sha, :string
    field :stats, :map
    field :url, :string
    embeds_many :files, GitHubOpenAPI.DiffEntry
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:author, :comments_url, :committer, :html_url, :node_id, :parents, :sha, :url, :__info__, :__joins__])
        |> cast_embed(:files, with: &GitHubOpenAPI.DiffEntry.changeset/2)
  end
end
