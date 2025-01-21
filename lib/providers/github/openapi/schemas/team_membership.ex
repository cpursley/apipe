defmodule GitHubOpenAPI.TeamMembership do
  @moduledoc """
  Provides struct and type for a TeamMembership
  """
  use Apipe.Providers.OpenAPIEncoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          role: String.t(),
          state: String.t(),
          url: String.t()
        }

  defstruct [:__info__, :__joins__, :role, :state, :url]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      role: {:enum, ["member", "maintainer"]},
      state: {:enum, ["active", "pending"]},
      url: {:string, :uri}
    ]
  end
end
