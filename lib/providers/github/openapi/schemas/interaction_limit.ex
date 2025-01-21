defmodule GitHubOpenAPI.InteractionLimit do
  @moduledoc """
  Provides struct and type for a InteractionLimit
  """
  use Apipe.Providers.OpenAPIEncoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          expiry: String.t() | nil,
          limit: String.t()
        }

  defstruct [:__info__, :__joins__, :expiry, :limit]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      expiry: {:enum, ["one_day", "three_days", "one_week", "one_month", "six_months"]},
      limit: {:enum, ["existing_users", "contributors_only", "collaborators_only"]}
    ]
  end
end
