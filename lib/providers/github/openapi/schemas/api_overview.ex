defmodule GitHubOpenAPI.ApiOverview do
  @moduledoc """
  Provides struct and type for a ApiOverview
  """
  use Apipe.Providers.OpenAPIEncoder

  @type t :: %__MODULE__{
          __info__: map,
          actions: [String.t()] | nil,
          actions_macos: [String.t()] | nil,
          api: [String.t()] | nil,
          codespaces: [String.t()] | nil,
          copilot: [String.t()] | nil,
          dependabot: [String.t()] | nil,
          domains: GitHubOpenAPI.ApiOverviewDomains.t() | nil,
          git: [String.t()] | nil,
          github_enterprise_importer: [String.t()] | nil,
          hooks: [String.t()] | nil,
          importer: [String.t()] | nil,
          packages: [String.t()] | nil,
          pages: [String.t()] | nil,
          ssh_key_fingerprints: GitHubOpenAPI.ApiOverviewSshKeyFingerprints.t() | nil,
          ssh_keys: [String.t()] | nil,
          verifiable_password_authentication: boolean,
          web: [String.t()] | nil
        }

  defstruct [
    :__info__,
    :actions,
    :actions_macos,
    :api,
    :codespaces,
    :copilot,
    :dependabot,
    :domains,
    :git,
    :github_enterprise_importer,
    :hooks,
    :importer,
    :packages,
    :pages,
    :ssh_key_fingerprints,
    :ssh_keys,
    :verifiable_password_authentication,
    :web
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      actions: [string: :generic],
      actions_macos: [string: :generic],
      api: [string: :generic],
      codespaces: [string: :generic],
      copilot: [string: :generic],
      dependabot: [string: :generic],
      domains: {GitHubOpenAPI.ApiOverviewDomains, :t},
      git: [string: :generic],
      github_enterprise_importer: [string: :generic],
      hooks: [string: :generic],
      importer: [string: :generic],
      packages: [string: :generic],
      pages: [string: :generic],
      ssh_key_fingerprints: {GitHubOpenAPI.ApiOverviewSshKeyFingerprints, :t},
      ssh_keys: [string: :generic],
      verifiable_password_authentication: :boolean,
      web: [string: :generic]
    ]
  end
end
