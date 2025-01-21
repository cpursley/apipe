defmodule GitHubOpenAPI.DependencyGraphSpdxSbomSbomPackages do
  @moduledoc """
  Provides struct and type for a DependencyGraphSpdxSbomSbomPackages
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{
          SPDXID: String.t() | nil,
          __info__: map,
          __joins__: map,
          copyrightText: String.t() | nil,
          downloadLocation: String.t() | nil,
          externalRefs: [GitHubOpenAPI.DependencyGraphSpdxSbomSbomPackagesExternalRefs.t()] | nil,
          filesAnalyzed: boolean | nil,
          licenseConcluded: String.t() | nil,
          licenseDeclared: String.t() | nil,
          name: String.t() | nil,
          supplier: String.t() | nil,
          versionInfo: String.t() | nil
        }

  defstruct [
    :SPDXID,
    :__info__,
    :__joins__,
    :copyrightText,
    :downloadLocation,
    :externalRefs,
    :filesAnalyzed,
    :licenseConcluded,
    :licenseDeclared,
    :name,
    :supplier,
    :versionInfo
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      SPDXID: {:string, :generic},
      copyrightText: {:string, :generic},
      downloadLocation: {:string, :generic},
      externalRefs: [{GitHubOpenAPI.DependencyGraphSpdxSbomSbomPackagesExternalRefs, :t}],
      filesAnalyzed: :boolean,
      licenseConcluded: {:string, :generic},
      licenseDeclared: {:string, :generic},
      name: {:string, :generic},
      supplier: {:string, :generic},
      versionInfo: {:string, :generic}
    ]
  end
end
