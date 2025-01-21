defmodule GitHubOpenAPI.ApiOverviewDomainsArtifactAttestations do
  @moduledoc """
  Provides struct and type for a ApiOverviewDomainsArtifactAttestations
  """
  use Apipe.Providers.OpenAPIEncoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          services: [String.t()] | nil,
          trust_domain: String.t() | nil
        }

  defstruct [:__info__, :__joins__, :services, :trust_domain]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [services: [string: :generic], trust_domain: {:string, :generic}]
  end
end
