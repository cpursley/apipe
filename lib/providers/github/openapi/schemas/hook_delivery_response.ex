defmodule GitHubOpenAPI.HookDeliveryResponse do
  @moduledoc """
  Provides struct and type for a HookDeliveryResponse
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          headers: map | nil,
          payload: String.t() | nil
        }

  defstruct [:__info__, :__joins__, :headers, :payload]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [headers: :map, payload: {:string, :generic}]
  end
end
