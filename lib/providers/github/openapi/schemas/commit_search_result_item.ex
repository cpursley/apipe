defmodule GitHubOpenAPI.CommitSearchResultItem do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :comments_url, :string
    field :commit, :map
    field :html_url, :string
    field :node_id, :string
    field :parents, {:array, :string}
    field :score, :float
    field :sha, :string
    field :url, :string
    embeds_one :author, GitHubOpenAPI.NullableSimpleUser
    embeds_one :committer, GitHubOpenAPI.NullableGitUser
    embeds_one :repository, GitHubOpenAPI.MinimalRepository
    embeds_one :text_matches, GitHubOpenAPI.SearchResultTextMatches
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:comments_url, :html_url, :node_id, :parents, :score, :sha, :url, :__info__, :__joins__])
        |> cast_embed(:author, with: &GitHubOpenAPI.NullableSimpleUser.changeset/2)
    |> cast_embed(:committer, with: &GitHubOpenAPI.NullableGitUser.changeset/2)
    |> cast_embed(:repository, with: &GitHubOpenAPI.MinimalRepository.changeset/2)
    |> cast_embed(:text_matches, with: &GitHubOpenAPI.SearchResultTextMatches.changeset/2)
  end
end
