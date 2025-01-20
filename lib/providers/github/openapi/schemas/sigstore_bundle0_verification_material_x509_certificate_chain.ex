defmodule GitHubOpenAPI.SigstoreBundle0VerificationMaterialX509CertificateChain do
  @moduledoc """
  Provides struct and type for a SigstoreBundle0VerificationMaterialX509CertificateChain
  """
  use Apipe.Providers.OpenAPIEncoder

  @type t :: %__MODULE__{
          __info__: map,
          certificates:
            [
              GitHubOpenAPI.SigstoreBundle0VerificationMaterialX509CertificateChainCertificates.t()
            ]
            | nil
        }

  defstruct [:__info__, :certificates]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      certificates: [
        {GitHubOpenAPI.SigstoreBundle0VerificationMaterialX509CertificateChainCertificates, :t}
      ]
    ]
  end
end
