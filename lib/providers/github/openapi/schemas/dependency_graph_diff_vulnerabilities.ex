defmodule GitHubOpenAPI.DependencyGraphDiffVulnerabilities do
  @moduledoc """
  Provides struct and type for a DependencyGraphDiffVulnerabilities
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          advisory_ghsa_id: String.t(),
          advisory_summary: String.t(),
          advisory_url: String.t(),
          severity: String.t()
        }

  defstruct [
    :__info__,
    :__joins__,
    :advisory_ghsa_id,
    :advisory_summary,
    :advisory_url,
    :severity
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      advisory_ghsa_id: {:string, :generic},
      advisory_summary: {:string, :generic},
      advisory_url: {:string, :generic},
      severity: {:string, :generic}
    ]
  end
end
