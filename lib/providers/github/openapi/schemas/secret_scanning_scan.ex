defmodule GitHubOpenAPI.SecretScanningScan do
  @moduledoc """
  Provides struct and type for a SecretScanningScan
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          completed_at: DateTime.t() | nil,
          started_at: DateTime.t() | nil,
          status: String.t() | nil,
          type: String.t() | nil
        }

  defstruct [:__info__, :__joins__, :completed_at, :started_at, :status, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      completed_at: {:union, [{:string, :date_time}, :null]},
      started_at: {:union, [{:string, :date_time}, :null]},
      status: {:string, :generic},
      type: {:string, :generic}
    ]
  end
end
