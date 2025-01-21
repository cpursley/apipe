defmodule GitHubOpenAPI.RepositoryAdvisoryCreateVulnerabilities do
  @moduledoc """
  Provides struct and type for a RepositoryAdvisoryCreateVulnerabilities
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          package: GitHubOpenAPI.RepositoryAdvisoryCreateVulnerabilitiesPackage.t(),
          patched_versions: String.t() | nil,
          vulnerable_functions: [String.t()] | nil,
          vulnerable_version_range: String.t() | nil
        }

  defstruct [
    :__info__,
    :__joins__,
    :package,
    :patched_versions,
    :vulnerable_functions,
    :vulnerable_version_range
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      package: {GitHubOpenAPI.RepositoryAdvisoryCreateVulnerabilitiesPackage, :t},
      patched_versions: {:union, [{:string, :generic}, :null]},
      vulnerable_functions: {:union, [[string: :generic], :null]},
      vulnerable_version_range: {:union, [{:string, :generic}, :null]}
    ]
  end
end
