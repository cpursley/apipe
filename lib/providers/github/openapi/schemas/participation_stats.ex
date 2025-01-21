defmodule GitHubOpenAPI.ParticipationStats do
  @moduledoc """
  Provides struct and type for a ParticipationStats
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{__info__: map, __joins__: map, all: [integer], owner: [integer]}

  defstruct [:__info__, :__joins__, :all, :owner]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [all: [:integer], owner: [:integer]]
  end
end
