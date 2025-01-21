defmodule GitHubOpenAPI.CodeScanningVariantAnalysis do
  @moduledoc """
  Provides struct and type for a CodeScanningVariantAnalysis
  """
  use Apipe.Providers.OpenAPIEncoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          actions_workflow_run_id: integer | nil,
          actor: GitHubOpenAPI.SimpleUser.t(),
          completed_at: DateTime.t() | nil,
          controller_repo: GitHubOpenAPI.SimpleRepository.t(),
          created_at: DateTime.t() | nil,
          failure_reason: String.t() | nil,
          id: integer,
          query_language: String.t(),
          query_pack_url: String.t(),
          scanned_repositories:
            [GitHubOpenAPI.CodeScanningVariantAnalysisScannedRepositories.t()] | nil,
          skipped_repositories:
            GitHubOpenAPI.CodeScanningVariantAnalysisSkippedRepositories.t() | nil,
          status: String.t(),
          updated_at: DateTime.t() | nil
        }

  defstruct [
    :__info__,
    :__joins__,
    :actions_workflow_run_id,
    :actor,
    :completed_at,
    :controller_repo,
    :created_at,
    :failure_reason,
    :id,
    :query_language,
    :query_pack_url,
    :scanned_repositories,
    :skipped_repositories,
    :status,
    :updated_at
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      actions_workflow_run_id: :integer,
      actor: {GitHubOpenAPI.SimpleUser, :t},
      completed_at: {:union, [{:string, :date_time}, :null]},
      controller_repo: {GitHubOpenAPI.SimpleRepository, :t},
      created_at: {:string, :date_time},
      failure_reason:
        {:enum, ["no_repos_queried", "actions_workflow_run_failed", "internal_error"]},
      id: :integer,
      query_language:
        {:enum, ["cpp", "csharp", "go", "java", "javascript", "python", "ruby", "swift"]},
      query_pack_url: {:string, :generic},
      scanned_repositories: [{GitHubOpenAPI.CodeScanningVariantAnalysisScannedRepositories, :t}],
      skipped_repositories: {GitHubOpenAPI.CodeScanningVariantAnalysisSkippedRepositories, :t},
      status: {:enum, ["in_progress", "succeeded", "failed", "cancelled"]},
      updated_at: {:string, :date_time}
    ]
  end
end
