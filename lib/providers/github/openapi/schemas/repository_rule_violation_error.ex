defmodule GitHubOpenAPI.RepositoryRuleViolationError do
  @moduledoc """
  Provides struct and type for a RepositoryRuleViolationError
  """
  use Apipe.Providers.OpenAPIEncoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          documentation_url: String.t() | nil,
          message: String.t() | nil,
          metadata: GitHubOpenAPI.RepositoryRuleViolationErrorMetadata.t() | nil,
          status: String.t() | nil
        }

  defstruct [:__info__, :__joins__, :documentation_url, :message, :metadata, :status]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      documentation_url: {:string, :generic},
      message: {:string, :generic},
      metadata: {GitHubOpenAPI.RepositoryRuleViolationErrorMetadata, :t},
      status: {:string, :generic}
    ]
  end
end
