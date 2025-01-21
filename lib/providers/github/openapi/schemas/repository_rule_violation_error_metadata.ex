defmodule GitHubOpenAPI.RepositoryRuleViolationErrorMetadata do
  @moduledoc """
  Provides struct and type for a RepositoryRuleViolationErrorMetadata
  """
  use Apipe.Providers.OpenAPIEncoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          secret_scanning:
            GitHubOpenAPI.RepositoryRuleViolationErrorMetadataSecretScanning.t() | nil
        }

  defstruct [:__info__, :__joins__, :secret_scanning]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [secret_scanning: {GitHubOpenAPI.RepositoryRuleViolationErrorMetadataSecretScanning, :t}]
  end
end
