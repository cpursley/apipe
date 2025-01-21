defmodule GitHubOpenAPI.Traffic do
  @moduledoc """
  Provides struct and type for a Traffic
  """
  use Apipe.Providers.OpenAPIEncoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          count: integer,
          timestamp: DateTime.t(),
          uniques: integer
        }

  defstruct [:__info__, :__joins__, :count, :timestamp, :uniques]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [count: :integer, timestamp: {:string, :date_time}, uniques: :integer]
  end
end
