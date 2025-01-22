defmodule GitHubOpenAPI.ScimError do
  @moduledoc """
  Provides struct and type for a ScimError
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          detail: String.t() | nil,
          documentation_url: String.t() | nil,
          message: String.t() | nil,
          schemas: [String.t()] | nil,
          scimType: String.t() | nil,
          status: integer | nil
        }

  defstruct [
    :__info__,
    :__joins__,
    :detail,
    :documentation_url,
    :message,
    :schemas,
    :scimType,
    :status
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      detail: {:string, :generic},
      documentation_url: {:string, :generic},
      message: {:string, :generic},
      schemas: [string: :generic],
      scimType: {:string, :generic},
      status: :integer
    ]
  end
end
