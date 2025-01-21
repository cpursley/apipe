defmodule GitHubOpenAPI.CodespacesUserPublicKey do
  @moduledoc """
  Provides struct and type for a CodespacesUserPublicKey
  """
  use Apipe.Providers.OpenAPIEncoder

  @type t :: %__MODULE__{__info__: map, __joins__: map, key: String.t(), key_id: String.t()}

  defstruct [:__info__, :__joins__, :key, :key_id]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [key: {:string, :generic}, key_id: {:string, :generic}]
  end
end
