defmodule GitHubOpenAPI.SigstoreBundle0VerificationMaterialTlogEntriesInclusionPromise do
  @moduledoc """
  Provides struct and type for a SigstoreBundle0VerificationMaterialTlogEntriesInclusionPromise
  """
  use Apipe.Providers.OpenAPIEncoder

  @type t :: %__MODULE__{__info__: map, __joins__: map, signedEntryTimestamp: String.t() | nil}

  defstruct [:__info__, :__joins__, :signedEntryTimestamp]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [signedEntryTimestamp: {:string, :generic}]
  end
end
