defmodule GitHubOpenAPI.CodeScanningVariantAnalysisSkippedRepoGroup do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :repository_count, :integer
    embeds_many :repositories, GitHubOpenAPI.CodeScanningVariantAnalysisRepository
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:repository_count, :__info__, :__joins__])
        |> cast_embed(:repositories, with: &GitHubOpenAPI.CodeScanningVariantAnalysisRepository.changeset/2)
  end
end
