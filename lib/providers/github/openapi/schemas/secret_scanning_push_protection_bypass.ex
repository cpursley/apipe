defmodule GitHubOpenAPI.SecretScanningPushProtectionBypass do
  @moduledoc """
  Provides struct and type for a SecretScanningPushProtectionBypass
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          expire_at: DateTime.t() | nil,
          reason: String.t() | nil,
          token_type: String.t() | nil
        }

  defstruct [:__info__, :__joins__, :expire_at, :reason, :token_type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      expire_at: {:union, [{:string, :date_time}, :null]},
      reason: {:enum, ["false_positive", "used_in_tests", "will_fix_later"]},
      token_type: {:string, :generic}
    ]
  end
end
