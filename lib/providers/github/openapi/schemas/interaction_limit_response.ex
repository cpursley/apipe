defmodule GitHubOpenAPI.InteractionLimitResponse do
  @moduledoc """
  Provides struct and type for a InteractionLimitResponse
  """
  use Apipe.Providers.OpenAPIEncoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          expires_at: DateTime.t(),
          limit: String.t(),
          origin: String.t()
        }

  defstruct [:__info__, :__joins__, :expires_at, :limit, :origin]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      expires_at: {:string, :date_time},
      limit: {:enum, ["existing_users", "contributors_only", "collaborators_only"]},
      origin: {:string, :generic}
    ]
  end
end
