defmodule GitHubOpenAPI.StaticPublicIPLimitsForGitHubHostedHostedRunners do
  @moduledoc """
  Provides struct and type for a StaticPublicIPLimitsForGitHubHostedHostedRunners
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{__info__: map, __joins__: map, current_usage: integer, maximum: integer}

  defstruct [:__info__, :__joins__, :current_usage, :maximum]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [current_usage: :integer, maximum: :integer]
  end
end
