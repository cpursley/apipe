defmodule GitHubOpenAPI.DockerMetadata do
  @moduledoc """
  Provides struct and type for a DockerMetadata
  """
  use Apipe.Providers.OpenAPIEncoder

  @type t :: %__MODULE__{__info__: map, __joins__: map, tag: [String.t()] | nil}

  defstruct [:__info__, :__joins__, :tag]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [tag: [string: :generic]]
  end
end
