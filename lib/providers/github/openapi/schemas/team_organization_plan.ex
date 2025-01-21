defmodule GitHubOpenAPI.TeamOrganizationPlan do
  @moduledoc """
  Provides struct and type for a TeamOrganizationPlan
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          filled_seats: integer | nil,
          name: String.t(),
          private_repos: integer,
          seats: integer | nil,
          space: integer
        }

  defstruct [:__info__, :__joins__, :filled_seats, :name, :private_repos, :seats, :space]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      filled_seats: :integer,
      name: {:string, :generic},
      private_repos: :integer,
      seats: :integer,
      space: :integer
    ]
  end
end
