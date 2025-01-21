defmodule GitHubOpenAPI.CloneTraffic do
  @moduledoc """
  Provides struct and type for a CloneTraffic
  """
  use Apipe.Providers.OpenAPIEncoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          clones: [GitHubOpenAPI.Traffic.t()],
          count: integer,
          uniques: integer
        }

  defstruct [:__info__, :__joins__, :clones, :count, :uniques]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [clones: [{GitHubOpenAPI.Traffic, :t}], count: :integer, uniques: :integer]
  end
end
