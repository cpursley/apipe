defmodule GitHubOpenAPI.SearchResultTextMatches do
  @moduledoc """
  Provides struct and type for a SearchResultTextMatches
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          fragment: String.t() | nil,
          matches: [GitHubOpenAPI.SearchResultTextMatchesMatches.t()] | nil,
          object_type: String.t() | nil,
          object_url: String.t() | nil,
          property: String.t() | nil
        }

  defstruct [:__info__, :__joins__, :fragment, :matches, :object_type, :object_url, :property]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      fragment: {:string, :generic},
      matches: [{GitHubOpenAPI.SearchResultTextMatchesMatches, :t}],
      object_type: {:string, :generic},
      object_url: {:string, :generic},
      property: {:string, :generic}
    ]
  end
end
