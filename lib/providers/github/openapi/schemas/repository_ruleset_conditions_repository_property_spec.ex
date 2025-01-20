defmodule GitHubOpenAPI.RepositoryRulesetConditionsRepositoryPropertySpec do
  @moduledoc """
  Provides struct and type for a RepositoryRulesetConditionsRepositoryPropertySpec
  """
  use Apipe.Providers.OpenAPIEncoder

  @type t :: %__MODULE__{
          __info__: map,
          name: String.t(),
          property_values: [String.t()],
          source: String.t() | nil
        }

  defstruct [:__info__, :name, :property_values, :source]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      name: {:string, :generic},
      property_values: [string: :generic],
      source: {:enum, ["custom", "system"]}
    ]
  end
end
