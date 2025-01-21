defmodule GitHubOpenAPI.SigstoreBundle0VerificationMaterialTlogEntries do
  @moduledoc """
  Provides struct and type for a SigstoreBundle0VerificationMaterialTlogEntries
  """
  use Apipe.Providers.OpenAPIEncoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          canonicalizedBody: String.t() | nil,
          inclusionPromise:
            GitHubOpenAPI.SigstoreBundle0VerificationMaterialTlogEntriesInclusionPromise.t() | nil,
          inclusionProof: String.t() | nil,
          integratedTime: String.t() | nil,
          kindVersion:
            GitHubOpenAPI.SigstoreBundle0VerificationMaterialTlogEntriesKindVersion.t() | nil,
          logId: GitHubOpenAPI.SigstoreBundle0VerificationMaterialTlogEntriesLogId.t() | nil,
          logIndex: String.t() | nil
        }

  defstruct [
    :__info__,
    :__joins__,
    :canonicalizedBody,
    :inclusionPromise,
    :inclusionProof,
    :integratedTime,
    :kindVersion,
    :logId,
    :logIndex
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      canonicalizedBody: {:string, :generic},
      inclusionPromise:
        {GitHubOpenAPI.SigstoreBundle0VerificationMaterialTlogEntriesInclusionPromise, :t},
      inclusionProof: {:union, [{:string, :generic}, :null]},
      integratedTime: {:string, :generic},
      kindVersion: {GitHubOpenAPI.SigstoreBundle0VerificationMaterialTlogEntriesKindVersion, :t},
      logId: {GitHubOpenAPI.SigstoreBundle0VerificationMaterialTlogEntriesLogId, :t},
      logIndex: {:string, :generic}
    ]
  end
end
