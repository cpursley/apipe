defmodule GitHubOpenAPI.CodeScanningVariantAnalysisRepoTask do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :artifact_size_in_bytes, :integer
    field :artifact_url, :string
    field :database_commit_sha, :string
    field :failure_message, :string
    field :result_count, :integer
    field :source_location_prefix, :string
    embeds_one :analysis_status, GitHubOpenAPI.CodeScanningVariantAnalysisStatus
    embeds_one :repository, GitHubOpenAPI.SimpleRepository
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:artifact_size_in_bytes, :artifact_url, :database_commit_sha, :failure_message, :result_count, :source_location_prefix, :__info__, :__joins__])
        |> cast_embed(:analysis_status, with: &GitHubOpenAPI.CodeScanningVariantAnalysisStatus.changeset/2)
    |> cast_embed(:repository, with: &GitHubOpenAPI.SimpleRepository.changeset/2)
  end
end
