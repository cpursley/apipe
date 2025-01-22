defmodule GitHubOpenAPI.CombinedCommitStatus do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :commit_url, :string
    field :sha, :string
    field :state, :string
    field :total_count, :integer
    field :url, :string
    embeds_one :repository, GitHubOpenAPI.MinimalRepository
    embeds_many :statuses, GitHubOpenAPI.SimpleCommitStatus
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:commit_url, :sha, :state, :total_count, :url, :__info__, :__joins__])
        |> cast_embed(:repository, with: &GitHubOpenAPI.MinimalRepository.changeset/2)
    |> cast_embed(:statuses, with: &GitHubOpenAPI.SimpleCommitStatus.changeset/2)
  end
end
