defmodule GitHubOpenAPI.Verification do
  @moduledoc """
  Provides struct and type for a Verification
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          payload: String.t() | nil,
          reason: String.t(),
          signature: String.t() | nil,
          verified: boolean,
          verified_at: String.t() | nil
        }

  defstruct [:__info__, :__joins__, :payload, :reason, :signature, :verified, :verified_at]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      payload: {:string, :generic},
      reason: {:string, :generic},
      signature: {:string, :generic},
      verified: :boolean,
      verified_at: {:string, :generic}
    ]
  end
end
