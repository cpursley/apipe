defmodule GitHubOpenAPI.CustomPropertyValue do
  @moduledoc """
  Provides struct and type for a CustomPropertyValue
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          property_name: String.t(),
          value: String.t() | [String.t()] | nil
        }

  defstruct [:__info__, :__joins__, :property_name, :value]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      property_name: {:string, :generic},
      value: {:union, [{:string, :generic}, [string: :generic]]}
    ]
  end
end
