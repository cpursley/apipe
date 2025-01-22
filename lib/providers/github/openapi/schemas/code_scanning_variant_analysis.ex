defmodule GitHubOpenAPI.CodeScanningVariantAnalysis do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :actions_workflow_run_id, :integer
    field :completed_at, :string
    field :created_at, :string
    field :failure_reason, Ecto.Enum, values: [:no_repos_queried, :actions_workflow_run_failed, :internal_error]
    field :id, :integer
    field :query_pack_url, :string
    field :scanned_repositories, {:array, :string}
    field :skipped_repositories, :map
    field :status, Ecto.Enum, values: [:in_progress, :succeeded, :failed, :cancelled]
    field :updated_at, :string
    embeds_one :actor, GitHubOpenAPI.SimpleUser
    embeds_one :controller_repo, GitHubOpenAPI.SimpleRepository
    embeds_one :query_language, GitHubOpenAPI.CodeScanningVariantAnalysisLanguage
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:actions_workflow_run_id, :completed_at, :created_at, :failure_reason, :id, :query_pack_url, :scanned_repositories, :status, :updated_at, :__info__, :__joins__])
        |> cast_embed(:actor, with: &GitHubOpenAPI.SimpleUser.changeset/2)
    |> cast_embed(:controller_repo, with: &GitHubOpenAPI.SimpleRepository.changeset/2)
    |> cast_embed(:query_language, with: &GitHubOpenAPI.CodeScanningVariantAnalysisLanguage.changeset/2)
  end
end
