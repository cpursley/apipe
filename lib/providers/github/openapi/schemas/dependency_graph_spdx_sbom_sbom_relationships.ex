defmodule GitHubOpenAPI.DependencyGraphSpdxSbomSbomRelationships do
  @moduledoc """
  Provides struct and type for a DependencyGraphSpdxSbomSbomRelationships
  """
  use Apipe.Providers.OpenAPIEncoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          relatedSpdxElement: String.t() | nil,
          relationshipType: String.t() | nil,
          spdxElementId: String.t() | nil
        }

  defstruct [:__info__, :__joins__, :relatedSpdxElement, :relationshipType, :spdxElementId]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      relatedSpdxElement: {:string, :generic},
      relationshipType: {:string, :generic},
      spdxElementId: {:string, :generic}
    ]
  end
end
