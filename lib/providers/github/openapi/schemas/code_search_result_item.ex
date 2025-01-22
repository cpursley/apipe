defmodule GitHubOpenAPI.CodeSearchResultItem do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :file_size, :integer
    field :git_url, :string
    field :html_url, :string
    field :language, :string
    field :last_modified_at, :string
    field :line_numbers, {:array, :string}
    field :name, :string
    field :path, :string
    field :score, :float
    field :sha, :string
    field :url, :string
    embeds_one :repository, GitHubOpenAPI.MinimalRepository
    embeds_one :text_matches, GitHubOpenAPI.SearchResultTextMatches
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:file_size, :git_url, :html_url, :language, :last_modified_at, :line_numbers, :name, :path, :score, :sha, :url, :__info__, :__joins__])
        |> cast_embed(:repository, with: &GitHubOpenAPI.MinimalRepository.changeset/2)
    |> cast_embed(:text_matches, with: &GitHubOpenAPI.SearchResultTextMatches.changeset/2)
  end
end
