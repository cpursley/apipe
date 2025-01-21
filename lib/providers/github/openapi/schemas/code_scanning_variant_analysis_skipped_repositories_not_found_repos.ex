defmodule GitHubOpenAPI.CodeScanningVariantAnalysisSkippedRepositoriesNotFoundRepos do
  @moduledoc """
  Provides struct and type for a CodeScanningVariantAnalysisSkippedRepositoriesNotFoundRepos
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          repository_count: integer,
          repository_full_names: [String.t()]
        }

  defstruct [:__info__, :__joins__, :repository_count, :repository_full_names]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [repository_count: :integer, repository_full_names: [string: :generic]]
  end
end
