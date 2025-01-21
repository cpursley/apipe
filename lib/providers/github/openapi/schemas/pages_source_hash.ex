defmodule GitHubOpenAPI.PagesSourceHash do
  @moduledoc """
  Provides struct and type for a PagesSourceHash
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{__info__: map, __joins__: map, branch: String.t(), path: String.t()}

  defstruct [:__info__, :__joins__, :branch, :path]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [branch: {:string, :generic}, path: {:string, :generic}]
  end
end
