defmodule GitHubOpenAPI.CheckAutomatedSecurityFixes do
  @moduledoc """
  Provides struct and type for a CheckAutomatedSecurityFixes
  """
  use Apipe.Providers.OpenAPIEncoder

  @type t :: %__MODULE__{__info__: map, __joins__: map, enabled: boolean, paused: boolean}

  defstruct [:__info__, :__joins__, :enabled, :paused]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [enabled: :boolean, paused: :boolean]
  end
end
