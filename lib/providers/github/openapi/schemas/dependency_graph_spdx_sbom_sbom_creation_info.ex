defmodule GitHubOpenAPI.DependencyGraphSpdxSbomSbomCreationInfo do
  @moduledoc """
  Provides struct and type for a DependencyGraphSpdxSbomSbomCreationInfo
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          created: String.t(),
          creators: [String.t()]
        }

  defstruct [:__info__, :__joins__, :created, :creators]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [created: {:string, :generic}, creators: [string: :generic]]
  end
end
