defmodule GitHubOpenAPI.RateLimitOverview do
  @moduledoc """
  Provides struct and type for a RateLimitOverview
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          rate: GitHubOpenAPI.RateLimit.t(),
          resources: GitHubOpenAPI.RateLimitOverviewResources.t()
        }

  defstruct [:__info__, :__joins__, :rate, :resources]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      rate: {GitHubOpenAPI.RateLimit, :t},
      resources: {GitHubOpenAPI.RateLimitOverviewResources, :t}
    ]
  end
end
