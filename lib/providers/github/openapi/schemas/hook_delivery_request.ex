defmodule GitHubOpenAPI.HookDeliveryRequest do
  @moduledoc """
  Provides struct and type for a HookDeliveryRequest
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{__info__: map, __joins__: map, headers: map | nil, payload: map | nil}

  defstruct [:__info__, :__joins__, :headers, :payload]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [headers: {:union, [:map, :null]}, payload: {:union, [:map, :null]}]
  end
end
