defmodule GitHubOpenAPI.DependencyGraphDiff do
  @moduledoc """
  Provides struct and type for a DependencyGraphDiff
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          change_type: String.t(),
          ecosystem: String.t(),
          license: String.t() | nil,
          manifest: String.t(),
          name: String.t(),
          package_url: String.t() | nil,
          scope: String.t(),
          source_repository_url: String.t() | nil,
          version: String.t(),
          vulnerabilities: [GitHubOpenAPI.DependencyGraphDiffVulnerabilities.t()]
        }

  defstruct [
    :__info__,
    :__joins__,
    :change_type,
    :ecosystem,
    :license,
    :manifest,
    :name,
    :package_url,
    :scope,
    :source_repository_url,
    :version,
    :vulnerabilities
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      change_type: {:enum, ["added", "removed"]},
      ecosystem: {:string, :generic},
      license: {:string, :generic},
      manifest: {:string, :generic},
      name: {:string, :generic},
      package_url: {:string, :generic},
      scope: {:enum, ["unknown", "runtime", "development"]},
      source_repository_url: {:string, :generic},
      version: {:string, :generic},
      vulnerabilities: [{GitHubOpenAPI.DependencyGraphDiffVulnerabilities, :t}]
    ]
  end
end
