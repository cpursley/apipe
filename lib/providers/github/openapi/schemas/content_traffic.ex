defmodule GitHubOpenAPI.ContentTraffic do
  @moduledoc """
  Provides struct and type for a ContentTraffic
  """
  use Apipe.Providers.OpenAPIEncoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          count: integer,
          path: String.t(),
          title: String.t(),
          uniques: integer
        }

  defstruct [:__info__, :__joins__, :count, :path, :title, :uniques]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [count: :integer, path: {:string, :generic}, title: {:string, :generic}, uniques: :integer]
  end
end
