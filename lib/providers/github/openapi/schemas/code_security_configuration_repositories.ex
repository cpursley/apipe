defmodule GitHubOpenAPI.CodeSecurityConfigurationRepositories do
  @moduledoc """
  Provides struct and type for a CodeSecurityConfigurationRepositories
  """
  use Apipe.Providers.OpenAPIEncoder

  @type t :: %__MODULE__{
          __info__: map,
          repository: GitHubOpenAPI.SimpleRepository.t() | nil,
          status: String.t() | nil
        }

  defstruct [:__info__, :repository, :status]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      repository: {GitHubOpenAPI.SimpleRepository, :t},
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
