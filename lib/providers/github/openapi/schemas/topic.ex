defmodule GitHubOpenAPI.Topic do
  @moduledoc """
  Provides struct and type for a Topic
  """
  use Apipe.Providers.OpenAPIEncoder

  @type t :: %__MODULE__{__info__: map, __joins__: map, names: [String.t()]}

  defstruct [:__info__, :__joins__, :names]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [names: [string: :generic]]
  end
end
