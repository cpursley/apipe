defmodule GitHubOpenAPI.NullableIntegrationPermissions do
  @moduledoc """
  Provides struct and type for a NullableIntegrationPermissions
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          checks: String.t() | nil,
          contents: String.t() | nil,
          deployments: String.t() | nil,
          issues: String.t() | nil,
          metadata: String.t() | nil
        }

  defstruct [:__info__, :__joins__, :checks, :contents, :deployments, :issues, :metadata]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      checks: {:string, :generic},
      contents: {:string, :generic},
      deployments: {:string, :generic},
      issues: {:string, :generic},
      metadata: {:string, :generic}
    ]
  end
end
