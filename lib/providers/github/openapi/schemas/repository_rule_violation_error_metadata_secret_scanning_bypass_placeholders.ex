defmodule GitHubOpenAPI.RepositoryRuleViolationErrorMetadataSecretScanningBypassPlaceholders do
  @moduledoc """
  Provides struct and type for a RepositoryRuleViolationErrorMetadataSecretScanningBypassPlaceholders
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          placeholder_id: String.t() | nil,
          token_type: String.t() | nil
        }

  defstruct [:__info__, :__joins__, :placeholder_id, :token_type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [placeholder_id: {:string, :generic}, token_type: {:string, :generic}]
  end
end
