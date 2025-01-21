defmodule GitHubOpenAPI.DependabotAlertSecurityAdvisoryIdentifiers do
  @moduledoc """
  Provides struct and type for a DependabotAlertSecurityAdvisoryIdentifiers
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{__info__: map, __joins__: map, type: String.t(), value: String.t()}

  defstruct [:__info__, :__joins__, :type, :value]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [type: {:enum, ["CVE", "GHSA"]}, value: {:string, :generic}]
  end
end
