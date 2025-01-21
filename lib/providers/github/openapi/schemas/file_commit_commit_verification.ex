defmodule GitHubOpenAPI.FileCommitCommitVerification do
  @moduledoc """
  Provides struct and type for a FileCommitCommitVerification
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          payload: String.t() | nil,
          reason: String.t() | nil,
          signature: String.t() | nil,
          verified: boolean | nil,
          verified_at: String.t() | nil
        }

  defstruct [:__info__, :__joins__, :payload, :reason, :signature, :verified, :verified_at]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      payload: {:union, [{:string, :generic}, :null]},
      reason: {:string, :generic},
      signature: {:union, [{:string, :generic}, :null]},
      verified: :boolean,
      verified_at: {:union, [{:string, :generic}, :null]}
    ]
  end
end
