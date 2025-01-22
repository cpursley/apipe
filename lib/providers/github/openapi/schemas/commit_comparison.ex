defmodule GitHubOpenAPI.CommitComparison do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :ahead_by, :integer
    field :behind_by, :integer
    field :diff_url, :string
    field :html_url, :string
    field :patch_url, :string
    field :permalink_url, :string
    field :status, Ecto.Enum, values: [:diverged, :ahead, :behind, :identical]
    field :total_commits, :integer
    field :url, :string
    embeds_one :base_commit, GitHubOpenAPI.Commit
    embeds_many :commits, GitHubOpenAPI.Commit
    embeds_many :files, GitHubOpenAPI.DiffEntry
    embeds_one :merge_base_commit, GitHubOpenAPI.Commit
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:ahead_by, :behind_by, :diff_url, :html_url, :patch_url, :permalink_url, :status, :total_commits, :url, :__info__, :__joins__])
        |> cast_embed(:base_commit, with: &GitHubOpenAPI.Commit.changeset/2)
    |> cast_embed(:commits, with: &GitHubOpenAPI.Commit.changeset/2)
    |> cast_embed(:files, with: &GitHubOpenAPI.DiffEntry.changeset/2)
    |> cast_embed(:merge_base_commit, with: &GitHubOpenAPI.Commit.changeset/2)
  end
end
