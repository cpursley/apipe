defmodule GitHubOpenAPI.DependencyGraphSpdxSbomSbom do
  @moduledoc """
  Provides struct and type for a DependencyGraphSpdxSbomSbom
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{
          SPDXID: String.t(),
          __info__: map,
          __joins__: map,
          comment: String.t() | nil,
          creationInfo: GitHubOpenAPI.DependencyGraphSpdxSbomSbomCreationInfo.t(),
          dataLicense: String.t(),
          documentNamespace: String.t(),
          name: String.t(),
          packages: [GitHubOpenAPI.DependencyGraphSpdxSbomSbomPackages.t()],
          relationships: [GitHubOpenAPI.DependencyGraphSpdxSbomSbomRelationships.t()] | nil,
          spdxVersion: String.t()
        }

  defstruct [
    :SPDXID,
    :__info__,
    :__joins__,
    :comment,
    :creationInfo,
    :dataLicense,
    :documentNamespace,
    :name,
    :packages,
    :relationships,
    :spdxVersion
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      SPDXID: {:string, :generic},
      comment: {:string, :generic},
      creationInfo: {GitHubOpenAPI.DependencyGraphSpdxSbomSbomCreationInfo, :t},
      dataLicense: {:string, :generic},
      documentNamespace: {:string, :generic},
      name: {:string, :generic},
      packages: [{GitHubOpenAPI.DependencyGraphSpdxSbomSbomPackages, :t}],
      relationships: [{GitHubOpenAPI.DependencyGraphSpdxSbomSbomRelationships, :t}],
      spdxVersion: {:string, :generic}
    ]
  end
end
