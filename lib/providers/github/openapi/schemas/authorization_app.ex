defmodule GitHubOpenAPI.AuthorizationApp do
  @moduledoc """
  Provides struct and type for a AuthorizationApp
  """
  use Apipe.Providers.OpenAPIEncoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          client_id: String.t(),
          name: String.t(),
          url: String.t()
        }

  defstruct [:__info__, :__joins__, :client_id, :name, :url]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [client_id: {:string, :generic}, name: {:string, :generic}, url: {:string, :uri}]
  end
end
