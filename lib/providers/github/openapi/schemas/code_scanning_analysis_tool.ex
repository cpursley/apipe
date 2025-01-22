defmodule GitHubOpenAPI.CodeScanningAnalysisTool do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    embeds_one :guid, GitHubOpenAPI.CodeScanningAnalysisToolGuid
    embeds_one :name, GitHubOpenAPI.CodeScanningAnalysisToolName
    embeds_one :version, GitHubOpenAPI.CodeScanningAnalysisToolVersion
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:__info__, :__joins__])
        |> cast_embed(:guid, with: &GitHubOpenAPI.CodeScanningAnalysisToolGuid.changeset/2)
    |> cast_embed(:name, with: &GitHubOpenAPI.CodeScanningAnalysisToolName.changeset/2)
    |> cast_embed(:version, with: &GitHubOpenAPI.CodeScanningAnalysisToolVersion.changeset/2)
  end
end
