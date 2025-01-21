defmodule GitHubOpenAPI.SigstoreBundle0 do
  @moduledoc """
  Provides struct and type for a SigstoreBundle0
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          dsseEnvelope: GitHubOpenAPI.SigstoreBundle0DsseEnvelope.t() | nil,
          mediaType: String.t() | nil,
          verificationMaterial: GitHubOpenAPI.SigstoreBundle0VerificationMaterial.t() | nil
        }

  defstruct [:__info__, :__joins__, :dsseEnvelope, :mediaType, :verificationMaterial]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      dsseEnvelope: {GitHubOpenAPI.SigstoreBundle0DsseEnvelope, :t},
      mediaType: {:string, :generic},
      verificationMaterial: {GitHubOpenAPI.SigstoreBundle0VerificationMaterial, :t}
    ]
  end
end
