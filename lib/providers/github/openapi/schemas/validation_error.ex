defmodule GitHubOpenAPI.ValidationError do
  @moduledoc """
  Provides struct and type for a ValidationError
  """
  use Apipe.Providers.OpenAPIEncoder

  @type t :: %__MODULE__{
          __info__: map,
          documentation_url: String.t(),
          errors: [GitHubOpenAPI.ValidationErrorErrors.t()] | nil,
          message: String.t()
        }

  defstruct [:__info__, :documentation_url, :errors, :message]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      documentation_url: {:string, :generic},
      errors: [{GitHubOpenAPI.ValidationErrorErrors, :t}],
      message: {:string, :generic}
    ]
  end
end
