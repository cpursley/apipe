defmodule GitHubOpenAPI.ApiOverviewDomainsActionsInbound do
  @moduledoc """
  Provides struct and type for a ApiOverviewDomainsActionsInbound
  """
  use Apipe.Providers.OpenAPIEncoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          full_domains: [String.t()] | nil,
          wildcard_domains: [String.t()] | nil
        }

  defstruct [:__info__, :__joins__, :full_domains, :wildcard_domains]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [full_domains: [string: :generic], wildcard_domains: [string: :generic]]
  end
end
