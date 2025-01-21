defmodule GitHubOpenAPI.CodeScanningVariantAnalysisSkippedRepoGroup do
  @moduledoc """
  Provides struct and type for a CodeScanningVariantAnalysisSkippedRepoGroup
  """
  use Apipe.Providers.OpenAPIEncoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          repositories: [GitHubOpenAPI.CodeScanningVariantAnalysisRepository.t()],
          repository_count: integer
        }

  defstruct [:__info__, :__joins__, :repositories, :repository_count]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      repositories: [{GitHubOpenAPI.CodeScanningVariantAnalysisRepository, :t}],
      repository_count: :integer
    ]
  end
end
