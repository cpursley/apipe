defmodule GitHubOpenAPI.CodeScanningAnalysis do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :deletable, :boolean
    field :error, :string
    field :id, :integer
    field :results_count, :integer
    field :rules_count, :integer
    field :warning, :string
    embeds_one :analysis_key, GitHubOpenAPI.CodeScanningAnalysisAnalysisKey
    embeds_one :category, GitHubOpenAPI.CodeScanningAnalysisCategory
    embeds_one :commit_sha, GitHubOpenAPI.CodeScanningAnalysisCommitSha
    embeds_one :created_at, GitHubOpenAPI.CodeScanningAnalysisCreatedAt
    embeds_one :environment, GitHubOpenAPI.CodeScanningAnalysisEnvironment
    embeds_one :ref, GitHubOpenAPI.CodeScanningRef
    embeds_one :sarif_id, GitHubOpenAPI.CodeScanningAnalysisSarifId
    embeds_one :tool, GitHubOpenAPI.CodeScanningAnalysisTool
    embeds_one :url, GitHubOpenAPI.CodeScanningAnalysisUrl
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:deletable, :error, :id, :results_count, :rules_count, :warning, :__info__, :__joins__])
        |> cast_embed(:analysis_key, with: &GitHubOpenAPI.CodeScanningAnalysisAnalysisKey.changeset/2)
    |> cast_embed(:category, with: &GitHubOpenAPI.CodeScanningAnalysisCategory.changeset/2)
    |> cast_embed(:commit_sha, with: &GitHubOpenAPI.CodeScanningAnalysisCommitSha.changeset/2)
    |> cast_embed(:created_at, with: &GitHubOpenAPI.CodeScanningAnalysisCreatedAt.changeset/2)
    |> cast_embed(:environment, with: &GitHubOpenAPI.CodeScanningAnalysisEnvironment.changeset/2)
    |> cast_embed(:ref, with: &GitHubOpenAPI.CodeScanningRef.changeset/2)
    |> cast_embed(:sarif_id, with: &GitHubOpenAPI.CodeScanningAnalysisSarifId.changeset/2)
    |> cast_embed(:tool, with: &GitHubOpenAPI.CodeScanningAnalysisTool.changeset/2)
    |> cast_embed(:url, with: &GitHubOpenAPI.CodeScanningAnalysisUrl.changeset/2)
  end
end
