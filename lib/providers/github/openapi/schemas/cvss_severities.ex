defmodule GitHubOpenAPI.CvssSeverities do
  @moduledoc """
  Provides struct and type for a CvssSeverities
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          cvss_v3: GitHubOpenAPI.CvssSeveritiesCvssV3.t() | nil,
          cvss_v4: GitHubOpenAPI.CvssSeveritiesCvssV4.t() | nil
        }

  defstruct [:__info__, :__joins__, :cvss_v3, :cvss_v4]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      cvss_v3: {GitHubOpenAPI.CvssSeveritiesCvssV3, :t},
      cvss_v4: {GitHubOpenAPI.CvssSeveritiesCvssV4, :t}
    ]
  end
end
