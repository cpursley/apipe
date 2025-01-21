defmodule GitHubOpenAPI.RateLimitOverviewResources do
  @moduledoc """
  Provides struct and type for a RateLimitOverviewResources
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          actions_runner_registration: GitHubOpenAPI.RateLimit.t() | nil,
          code_scanning_autofix: GitHubOpenAPI.RateLimit.t() | nil,
          code_scanning_upload: GitHubOpenAPI.RateLimit.t() | nil,
          code_search: GitHubOpenAPI.RateLimit.t() | nil,
          core: GitHubOpenAPI.RateLimit.t(),
          dependency_snapshots: GitHubOpenAPI.RateLimit.t() | nil,
          graphql: GitHubOpenAPI.RateLimit.t() | nil,
          integration_manifest: GitHubOpenAPI.RateLimit.t() | nil,
          scim: GitHubOpenAPI.RateLimit.t() | nil,
          search: GitHubOpenAPI.RateLimit.t(),
          source_import: GitHubOpenAPI.RateLimit.t() | nil
        }

  defstruct [
    :__info__,
    :__joins__,
    :actions_runner_registration,
    :code_scanning_autofix,
    :code_scanning_upload,
    :code_search,
    :core,
    :dependency_snapshots,
    :graphql,
    :integration_manifest,
    :scim,
    :search,
    :source_import
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      actions_runner_registration: {GitHubOpenAPI.RateLimit, :t},
      code_scanning_autofix: {GitHubOpenAPI.RateLimit, :t},
      code_scanning_upload: {GitHubOpenAPI.RateLimit, :t},
      code_search: {GitHubOpenAPI.RateLimit, :t},
      core: {GitHubOpenAPI.RateLimit, :t},
      dependency_snapshots: {GitHubOpenAPI.RateLimit, :t},
      graphql: {GitHubOpenAPI.RateLimit, :t},
      integration_manifest: {GitHubOpenAPI.RateLimit, :t},
      scim: {GitHubOpenAPI.RateLimit, :t},
      search: {GitHubOpenAPI.RateLimit, :t},
      source_import: {GitHubOpenAPI.RateLimit, :t}
    ]
  end
end
