defmodule GitHubOpenAPI.NetworkSettings do
  @moduledoc """
  Provides struct and type for a NetworkSettings
  """
  use Apipe.Providers.OpenAPIEncoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          id: String.t(),
          name: String.t(),
          network_configuration_id: String.t() | nil,
          region: String.t(),
          subnet_id: String.t()
        }

  defstruct [:__info__, :__joins__, :id, :name, :network_configuration_id, :region, :subnet_id]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      id: {:string, :generic},
      name: {:string, :generic},
      network_configuration_id: {:string, :generic},
      region: {:string, :generic},
      subnet_id: {:string, :generic}
    ]
  end
end
