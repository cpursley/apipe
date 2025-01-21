defmodule GitHubOpenAPI.DependencyGraphSpdxSbom do
  @moduledoc """
  Provides struct and type for a DependencyGraphSpdxSbom
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          sbom: GitHubOpenAPI.DependencyGraphSpdxSbomSbom.t()
        }

  defstruct [:__info__, :__joins__, :sbom]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [sbom: {GitHubOpenAPI.DependencyGraphSpdxSbomSbom, :t}]
  end
end
