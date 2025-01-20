defmodule GitHubOpenAPI.ApiOverviewDomains do
  @moduledoc """
  Provides struct and type for a ApiOverviewDomains
  """
  use Apipe.Providers.OpenAPIEncoder

  @type t :: %__MODULE__{
          __info__: map,
          actions: [String.t()] | nil,
          actions_inbound: GitHubOpenAPI.ApiOverviewDomainsActionsInbound.t() | nil,
          artifact_attestations: GitHubOpenAPI.ApiOverviewDomainsArtifactAttestations.t() | nil,
          codespaces: [String.t()] | nil,
          copilot: [String.t()] | nil,
          packages: [String.t()] | nil,
          website: [String.t()] | nil
        }

  defstruct [
    :__info__,
    :actions,
    :actions_inbound,
    :artifact_attestations,
    :codespaces,
    :copilot,
    :packages,
    :website
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      actions: [string: :generic],
      actions_inbound: {GitHubOpenAPI.ApiOverviewDomainsActionsInbound, :t},
      artifact_attestations: {GitHubOpenAPI.ApiOverviewDomainsArtifactAttestations, :t},
      codespaces: [string: :generic],
      copilot: [string: :generic],
      packages: [string: :generic],
      website: [string: :generic]
    ]
  end
end
