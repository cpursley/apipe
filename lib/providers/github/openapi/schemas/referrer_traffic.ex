defmodule GitHubOpenAPI.ReferrerTraffic do
  @moduledoc """
  Provides struct and type for a ReferrerTraffic
  """
  use Apipe.Providers.OpenAPIEncoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          count: integer,
          referrer: String.t(),
          uniques: integer
        }

  defstruct [:__info__, :__joins__, :count, :referrer, :uniques]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [count: :integer, referrer: {:string, :generic}, uniques: :integer]
  end
end
