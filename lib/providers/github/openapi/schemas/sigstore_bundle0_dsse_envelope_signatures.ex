defmodule GitHubOpenAPI.SigstoreBundle0DsseEnvelopeSignatures do
  @moduledoc """
  Provides struct and type for a SigstoreBundle0DsseEnvelopeSignatures
  """
  use Apipe.Providers.OpenAPIEncoder

  @type t :: %__MODULE__{__info__: map, keyid: String.t() | nil, sig: String.t() | nil}

  defstruct [:__info__, :keyid, :sig]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [keyid: {:string, :generic}, sig: {:string, :generic}]
  end
end
