defmodule GitHubOpenAPI.SigstoreBundle0VerificationMaterialX509CertificateChainCertificates do
  @moduledoc """
  Provides struct and type for a SigstoreBundle0VerificationMaterialX509CertificateChainCertificates
  """
  use Apipe.Providers.OpenAPIEncoder

  @type t :: %__MODULE__{__info__: map, __joins__: map, rawBytes: String.t() | nil}

  defstruct [:__info__, :__joins__, :rawBytes]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [rawBytes: {:string, :generic}]
  end
end
