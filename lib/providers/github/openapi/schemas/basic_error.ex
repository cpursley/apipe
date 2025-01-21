defmodule GitHubOpenAPI.BasicError do
  @moduledoc """
  Provides struct and type for a BasicError
  """
  use Apipe.Providers.OpenAPIEncoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          documentation_url: String.t() | nil,
          message: String.t() | nil,
          status: String.t() | nil,
          url: String.t() | nil
        }

  defstruct [:__info__, :__joins__, :documentation_url, :message, :status, :url]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      documentation_url: {:string, :generic},
      message: {:string, :generic},
      status: {:string, :generic},
      url: {:string, :generic}
    ]
  end
end
