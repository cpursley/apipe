defmodule GitHubOpenAPI.Hovercard do
  @moduledoc """
  Provides struct and type for a Hovercard
  """
  use Apipe.Providers.OpenAPIEncoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          contexts: [GitHubOpenAPI.HovercardContexts.t()]
        }

  defstruct [:__info__, :__joins__, :contexts]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [contexts: [{GitHubOpenAPI.HovercardContexts, :t}]]
  end
end
