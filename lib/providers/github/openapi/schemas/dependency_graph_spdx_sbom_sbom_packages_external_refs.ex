defmodule GitHubOpenAPI.DependencyGraphSpdxSbomSbomPackagesExternalRefs do
  @moduledoc """
  Provides struct and type for a DependencyGraphSpdxSbomSbomPackagesExternalRefs
  """
  use Apipe.Providers.OpenAPIEncoder

  @type t :: %__MODULE__{
          __info__: map,
          referenceCategory: String.t(),
          referenceLocator: String.t(),
          referenceType: String.t()
        }

  defstruct [:__info__, :referenceCategory, :referenceLocator, :referenceType]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      referenceCategory: {:string, :generic},
      referenceLocator: {:string, :generic},
      referenceType: {:string, :generic}
    ]
  end
end
