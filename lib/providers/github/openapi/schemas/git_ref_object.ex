defmodule GitHubOpenAPI.GitRefObject do
  @moduledoc """
  Provides struct and type for a GitRefObject
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          sha: String.t(),
          type: String.t(),
          url: String.t()
        }

  defstruct [:__info__, :__joins__, :sha, :type, :url]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [sha: {:string, :generic}, type: {:string, :generic}, url: {:string, :uri}]
  end
end
