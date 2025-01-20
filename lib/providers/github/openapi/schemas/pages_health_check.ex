defmodule GitHubOpenAPI.PagesHealthCheck do
  @moduledoc """
  Provides struct and type for a PagesHealthCheck
  """
  use Apipe.Providers.OpenAPIEncoder

  @type t :: %__MODULE__{
          __info__: map,
          alt_domain: GitHubOpenAPI.PagesHealthCheckAltDomain.t() | nil,
          domain: GitHubOpenAPI.PagesHealthCheckDomain.t() | nil
        }

  defstruct [:__info__, :alt_domain, :domain]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      alt_domain: {:union, [{GitHubOpenAPI.PagesHealthCheckAltDomain, :t}, :null]},
      domain: {GitHubOpenAPI.PagesHealthCheckDomain, :t}
    ]
  end
end
