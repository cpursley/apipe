defmodule GitHubOpenAPI.SigstoreBundle0DsseEnvelope do
  @moduledoc """
  Provides struct and type for a SigstoreBundle0DsseEnvelope
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          payload: String.t() | nil,
          payloadType: String.t() | nil,
          signatures: [GitHubOpenAPI.SigstoreBundle0DsseEnvelopeSignatures.t()] | nil
        }

  defstruct [:__info__, :__joins__, :payload, :payloadType, :signatures]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      payload: {:string, :generic},
      payloadType: {:string, :generic},
      signatures: [{GitHubOpenAPI.SigstoreBundle0DsseEnvelopeSignatures, :t}]
    ]
  end
end
