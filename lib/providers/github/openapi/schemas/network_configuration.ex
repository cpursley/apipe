defmodule GitHubOpenAPI.NetworkConfiguration do
  @moduledoc """
  Provides struct and type for a NetworkConfiguration
  """
  use Apipe.Providers.OpenAPIEncoder

  @type t :: %__MODULE__{
          __info__: map,
          compute_service: String.t() | nil,
          created_on: DateTime.t() | nil,
          id: String.t(),
          name: String.t(),
          network_settings_ids: [String.t()] | nil
        }

  defstruct [:__info__, :compute_service, :created_on, :id, :name, :network_settings_ids]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      compute_service: {:enum, ["none", "actions", "codespaces"]},
      created_on: {:union, [{:string, :date_time}, :null]},
      id: {:string, :generic},
      name: {:string, :generic},
      network_settings_ids: [string: :generic]
    ]
  end
end
