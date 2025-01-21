defmodule GitHubOpenAPI.SigstoreBundle0VerificationMaterialTlogEntriesKindVersion do
  @moduledoc """
  Provides struct and type for a SigstoreBundle0VerificationMaterialTlogEntriesKindVersion
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          kind: String.t() | nil,
          version: String.t() | nil
        }

  defstruct [:__info__, :__joins__, :kind, :version]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [kind: {:string, :generic}, version: {:string, :generic}]
  end
end
