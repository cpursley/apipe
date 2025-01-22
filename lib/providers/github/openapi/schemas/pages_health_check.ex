defmodule GitHubOpenAPI.PagesHealthCheck do
  @moduledoc """
  Provides struct and type for a PagesHealthCheck
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          alt_domain: GitHubOpenAPI.PagesHealthCheckAltDomain.t() | nil,
          domain: GitHubOpenAPI.PagesHealthCheckDomain.t() | nil
        }

  defstruct [:__info__, :__joins__, :alt_domain, :domain]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      alt_domain: {GitHubOpenAPI.PagesHealthCheckAltDomain, :t},
      domain: {GitHubOpenAPI.PagesHealthCheckDomain, :t}
    ]
  end
end
