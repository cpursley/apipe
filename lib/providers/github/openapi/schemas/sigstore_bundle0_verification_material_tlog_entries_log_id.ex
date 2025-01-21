defmodule GitHubOpenAPI.SigstoreBundle0VerificationMaterialTlogEntriesLogId do
  @moduledoc """
  Provides struct and type for a SigstoreBundle0VerificationMaterialTlogEntriesLogId
  """
  use Apipe.Providers.OpenAPIEncoder

  @type t :: %__MODULE__{__info__: map, __joins__: map, keyId: String.t() | nil}

  defstruct [:__info__, :__joins__, :keyId]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [keyId: {:string, :generic}]
  end
end
