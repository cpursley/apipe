defmodule GitHubOpenAPI.ContainerMetadata do
  @moduledoc """
  Provides struct and type for a ContainerMetadata
  """
  use Apipe.Providers.OpenAPIEncoder

  @type t :: %__MODULE__{__info__: map, __joins__: map, tags: [String.t()]}

  defstruct [:__info__, :__joins__, :tags]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [tags: [string: :generic]]
  end
end
