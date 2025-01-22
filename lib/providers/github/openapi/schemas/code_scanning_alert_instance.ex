defmodule GitHubOpenAPI.CodeScanningAlertInstance do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :commit_sha, :string
    field :html_url, :string
    field :message, :map
    embeds_one :analysis_key, GitHubOpenAPI.CodeScanningAnalysisAnalysisKey
    embeds_one :category, GitHubOpenAPI.CodeScanningAnalysisCategory
    embeds_many :classifications, GitHubOpenAPI.CodeScanningAlertClassification
    embeds_one :environment, GitHubOpenAPI.CodeScanningAlertEnvironment
    embeds_one :location, GitHubOpenAPI.CodeScanningAlertLocation
    embeds_one :ref, GitHubOpenAPI.CodeScanningRef
    embeds_one :state, GitHubOpenAPI.CodeScanningAlertState
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:commit_sha, :html_url, :__info__, :__joins__])
        |> cast_embed(:analysis_key, with: &GitHubOpenAPI.CodeScanningAnalysisAnalysisKey.changeset/2)
    |> cast_embed(:category, with: &GitHubOpenAPI.CodeScanningAnalysisCategory.changeset/2)
    |> cast_embed(:classifications, with: &GitHubOpenAPI.CodeScanningAlertClassification.changeset/2)
    |> cast_embed(:environment, with: &GitHubOpenAPI.CodeScanningAlertEnvironment.changeset/2)
    |> cast_embed(:location, with: &GitHubOpenAPI.CodeScanningAlertLocation.changeset/2)
    |> cast_embed(:ref, with: &GitHubOpenAPI.CodeScanningRef.changeset/2)
    |> cast_embed(:state, with: &GitHubOpenAPI.CodeScanningAlertState.changeset/2)
  end
end
