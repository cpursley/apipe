defmodule GitHubOpenAPI.PublicUserPlan do
  @moduledoc """
  Provides struct and type for a PublicUserPlan
  """
  use Apipe.Providers.OpenAPIEncoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          collaborators: integer,
          name: String.t(),
          private_repos: integer,
          space: integer
        }

  defstruct [:__info__, :__joins__, :collaborators, :name, :private_repos, :space]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [collaborators: :integer, name: {:string, :generic}, private_repos: :integer, space: :integer]
  end
end
