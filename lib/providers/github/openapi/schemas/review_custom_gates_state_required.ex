defmodule GitHubOpenAPI.ReviewCustomGatesStateRequired do
  @moduledoc """
  Provides struct and type for a ReviewCustomGatesStateRequired
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          comment: String.t() | nil,
          environment_name: String.t(),
          state: String.t()
        }

  defstruct [:__info__, :__joins__, :comment, :environment_name, :state]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      comment: {:string, :generic},
      environment_name: {:string, :generic},
      state: {:enum, ["approved", "rejected"]}
    ]
  end
end
