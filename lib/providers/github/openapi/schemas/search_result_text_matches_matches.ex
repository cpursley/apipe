defmodule GitHubOpenAPI.SearchResultTextMatchesMatches do
  @moduledoc """
  Provides struct and type for a SearchResultTextMatchesMatches
  """
  use Apipe.Providers.OpenAPIEncoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          indices: [integer] | nil,
          text: String.t() | nil
        }

  defstruct [:__info__, :__joins__, :indices, :text]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [indices: [:integer], text: {:string, :generic}]
  end
end
