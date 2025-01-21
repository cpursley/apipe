defmodule GitHubOpenAPI.GlobalAdvisoryEpss do
  @moduledoc """
  Provides struct and type for a GlobalAdvisoryEpss
  """
  use Apipe.Providers.OpenAPIEncoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          percentage: number | nil,
          percentile: number | nil
        }

  defstruct [:__info__, :__joins__, :percentage, :percentile]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [percentage: :number, percentile: :number]
  end
end
