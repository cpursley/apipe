defmodule GitHubOpenAPI.CodeScanningVariantAnalysisSkippedRepositories do
  @moduledoc """
  Provides struct and type for a CodeScanningVariantAnalysisSkippedRepositories
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          access_mismatch_repos: GitHubOpenAPI.CodeScanningVariantAnalysisSkippedRepoGroup.t(),
          no_codeql_db_repos: GitHubOpenAPI.CodeScanningVariantAnalysisSkippedRepoGroup.t(),
          not_found_repos:
            GitHubOpenAPI.CodeScanningVariantAnalysisSkippedRepositoriesNotFoundRepos.t(),
          over_limit_repos: GitHubOpenAPI.CodeScanningVariantAnalysisSkippedRepoGroup.t()
        }

  defstruct [
    :__info__,
    :__joins__,
    :access_mismatch_repos,
    :no_codeql_db_repos,
    :not_found_repos,
    :over_limit_repos
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      access_mismatch_repos: {GitHubOpenAPI.CodeScanningVariantAnalysisSkippedRepoGroup, :t},
      no_codeql_db_repos: {GitHubOpenAPI.CodeScanningVariantAnalysisSkippedRepoGroup, :t},
      not_found_repos:
        {GitHubOpenAPI.CodeScanningVariantAnalysisSkippedRepositoriesNotFoundRepos, :t},
      over_limit_repos: {GitHubOpenAPI.CodeScanningVariantAnalysisSkippedRepoGroup, :t}
    ]
  end
end
