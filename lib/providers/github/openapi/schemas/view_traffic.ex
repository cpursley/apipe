defmodule GitHubOpenAPI.ViewTraffic do
  @moduledoc """
  Provides struct and type for a ViewTraffic
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          count: integer,
          uniques: integer,
          views: [GitHubOpenAPI.Traffic.t()]
        }

  defstruct [:__info__, :__joins__, :count, :uniques, :views]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [count: :integer, uniques: :integer, views: [{GitHubOpenAPI.Traffic, :t}]]
  end
end
