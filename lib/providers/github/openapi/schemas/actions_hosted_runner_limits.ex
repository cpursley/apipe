defmodule GitHubOpenAPI.ActionsHostedRunnerLimits do
  @moduledoc """
  Provides struct and type for a ActionsHostedRunnerLimits
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          public_ips: GitHubOpenAPI.StaticPublicIPLimitsForGitHubHostedHostedRunners.t()
        }

  defstruct [:__info__, :__joins__, :public_ips]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [public_ips: {GitHubOpenAPI.StaticPublicIPLimitsForGitHubHostedHostedRunners, :t}]
  end
end
