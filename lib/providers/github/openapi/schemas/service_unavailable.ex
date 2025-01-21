defmodule GitHubOpenAPI.ServiceUnavailable do
  @moduledoc """
  Provides struct and type for a ServiceUnavailable
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type json_resp :: %__MODULE__{
          __info__: map,
          __joins__: map,
          code: String.t() | nil,
          documentation_url: String.t() | nil,
          message: String.t() | nil
        }

  defstruct [:__info__, :__joins__, :code, :documentation_url, :message]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:json_resp) do
    [
      code: {:string, :generic},
      documentation_url: {:string, :generic},
      message: {:string, :generic}
    ]
  end
end
