defmodule GitHubOpenAPI.SecurityAndAnalysisDependabotSecurityUpdates do
  @moduledoc """
  Provides struct and type for a SecurityAndAnalysisDependabotSecurityUpdates
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{__info__: map, __joins__: map, status: String.t() | nil}

  defstruct [:__info__, :__joins__, :status]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [status: {:enum, ["enabled", "disabled"]}]
  end
end
