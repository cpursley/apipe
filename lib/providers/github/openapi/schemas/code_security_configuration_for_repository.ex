defmodule GitHubOpenAPI.CodeSecurityConfigurationForRepository do
  @moduledoc """
  Provides struct and type for a CodeSecurityConfigurationForRepository
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          configuration: GitHubOpenAPI.CodeSecurityConfiguration.t() | nil,
          status: String.t() | nil
        }

  defstruct [:__info__, :__joins__, :configuration, :status]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      configuration: {GitHubOpenAPI.CodeSecurityConfiguration, :t},
      status:
        {:enum,
         [
           "attached",
           "attaching",
           "detached",
           "removed",
           "enforced",
           "failed",
           "updating",
           "removed_by_enterprise"
         ]}
    ]
  end
end
