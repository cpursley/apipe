defmodule GitHubOpenAPI.CustomProperty do
  @moduledoc """
  Provides struct and type for a CustomProperty
  """
  use Apipe.Providers.OpenAPIEncoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          allowed_values: [String.t()] | nil,
          default_value: String.t() | [String.t()] | nil,
          description: String.t() | nil,
          property_name: String.t(),
          required: boolean | nil,
          source_type: String.t() | nil,
          url: String.t() | nil,
          value_type: String.t(),
          values_editable_by: String.t() | nil
        }

  defstruct [
    :__info__,
    :__joins__,
    :allowed_values,
    :default_value,
    :description,
    :property_name,
    :required,
    :source_type,
    :url,
    :value_type,
    :values_editable_by
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      allowed_values: {:union, [[string: :generic], :null]},
      default_value: {:union, [{:string, :generic}, [string: :generic]]},
      description: {:union, [{:string, :generic}, :null]},
      property_name: {:string, :generic},
      required: :boolean,
      source_type: {:enum, ["organization", "enterprise"]},
      url: {:string, :uri},
      value_type: {:enum, ["string", "single_select", "multi_select", "true_false"]},
      values_editable_by: {:enum, ["org_actors", "org_and_repo_actors", nil]}
    ]
  end
end
