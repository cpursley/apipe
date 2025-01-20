defmodule GitHubOpenAPI.RepositoryRuleViolationErrorMetadataSecretScanning do
  @moduledoc """
  Provides struct and type for a RepositoryRuleViolationErrorMetadataSecretScanning
  """
  use Apipe.Providers.OpenAPIEncoder

  @type t :: %__MODULE__{
          __info__: map,
          bypass_placeholders:
            [
              GitHubOpenAPI.RepositoryRuleViolationErrorMetadataSecretScanningBypassPlaceholders.t()
            ]
            | nil
        }

  defstruct [:__info__, :bypass_placeholders]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      bypass_placeholders: [
        {GitHubOpenAPI.RepositoryRuleViolationErrorMetadataSecretScanningBypassPlaceholders, :t}
      ]
    ]
  end
end
