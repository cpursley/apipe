defmodule GitHubOpenAPI.KeySimple do
  @moduledoc """
  Provides struct and type for a KeySimple
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{__info__: map, __joins__: map, id: integer, key: String.t()}

  defstruct [:__info__, :__joins__, :id, :key]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [id: :integer, key: {:string, :generic}]
  end
end
