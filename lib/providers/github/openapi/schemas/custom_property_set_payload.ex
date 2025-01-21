defmodule GitHubOpenAPI.CustomPropertySetPayload do
  @moduledoc """
  Provides struct and type for a CustomPropertySetPayload
  """
  use Apipe.Providers.OpenAPIEncoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          allowed_values: [String.t()] | nil,
          default_value: String.t() | [String.t()] | nil,
          description: String.t() | nil,
          required: boolean | nil,
          value_type: String.t()
        }

  defstruct [
    :__info__,
    :__joins__,
    :allowed_values,
    :default_value,
    :description,
    :required,
    :value_type
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      allowed_values: {:union, [[string: :generic], :null]},
      default_value: {:union, [{:string, :generic}, [string: :generic]]},
      description: {:union, [{:string, :generic}, :null]},
      required: :boolean,
      value_type: {:enum, ["string", "single_select", "multi_select", "true_false"]}
    ]
  end
end
