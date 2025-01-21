defmodule GitHubOpenAPI.CodeSecurityDefaultConfigurations do
  @moduledoc """
  Provides struct and type for a CodeSecurityDefaultConfigurations
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          configuration: GitHubOpenAPI.CodeSecurityConfiguration.t() | nil,
          default_for_new_repos: String.t() | nil
        }

  defstruct [:__info__, :__joins__, :configuration, :default_for_new_repos]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      configuration: {GitHubOpenAPI.CodeSecurityConfiguration, :t},
      default_for_new_repos: {:enum, ["public", "private_and_internal", "all"]}
    ]
  end
end
