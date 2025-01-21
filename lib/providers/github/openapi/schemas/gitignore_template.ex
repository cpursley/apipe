defmodule GitHubOpenAPI.GitignoreTemplate do
  @moduledoc """
  Provides struct and type for a GitignoreTemplate
  """
  use Apipe.Providers.OpenAPIEncoder

  @type t :: %__MODULE__{__info__: map, __joins__: map, name: String.t(), source: String.t()}

  defstruct [:__info__, :__joins__, :name, :source]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [name: {:string, :generic}, source: {:string, :generic}]
  end
end
