defmodule GitHubOpenAPI.CvssSeveritiesCvssV4 do
  @moduledoc """
  Provides struct and type for a CvssSeveritiesCvssV4
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          score: number | nil,
          vector_string: String.t() | nil
        }

  defstruct [:__info__, :__joins__, :score, :vector_string]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [score: :number, vector_string: {:string, :generic}]
  end
end
