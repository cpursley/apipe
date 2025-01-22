defmodule GitHubOpenAPI.HookDeliveryItem do
  @moduledoc """
  Provides struct and type for a HookDeliveryItem
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          action: String.t() | nil,
          delivered_at: DateTime.t(),
          duration: number,
          event: String.t(),
          guid: String.t(),
          id: integer,
          installation_id: integer | nil,
          redelivery: boolean,
          repository_id: integer | nil,
          status: String.t(),
          status_code: integer,
          throttled_at: DateTime.t() | nil
        }

  defstruct [
    :__info__,
    :__joins__,
    :action,
    :delivered_at,
    :duration,
    :event,
    :guid,
    :id,
    :installation_id,
    :redelivery,
    :repository_id,
    :status,
    :status_code,
    :throttled_at
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      action: {:string, :generic},
      delivered_at: {:string, :date_time},
      duration: :number,
      event: {:string, :generic},
      guid: {:string, :generic},
      id: :integer,
      installation_id: :integer,
      redelivery: :boolean,
      repository_id: :integer,
      status: {:string, :generic},
      status_code: :integer,
      throttled_at: {:string, :date_time}
    ]
  end
end
