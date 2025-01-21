defmodule GitHubOpenAPI.GistSimpleFiles do
  @moduledoc """
  Provides struct and type for a GistSimpleFiles
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{__info__: map, __joins__: map}

  defstruct [:__info__, :__joins__]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    []
  end
end
