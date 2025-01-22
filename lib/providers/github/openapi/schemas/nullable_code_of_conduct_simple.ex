defmodule GitHubOpenAPI.NullableCodeOfConductSimple do
  @moduledoc """
  Provides struct and type for a NullableCodeOfConductSimple
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          html_url: String.t() | nil,
          key: String.t(),
          name: String.t(),
          url: String.t()
        }

  defstruct [:__info__, :__joins__, :html_url, :key, :name, :url]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      html_url: {:string, :uri},
      key: {:string, :generic},
      name: {:string, :generic},
      url: {:string, :uri}
    ]
  end
end
