defmodule GitHubOpenAPI.PullRequestReviewRequest do
  @moduledoc """
  Provides struct and type for a PullRequestReviewRequest
  """
  use Apipe.Providers.OpenAPIEncoder

  @type t :: %__MODULE__{
          __info__: map,
          teams: [GitHubOpenAPI.Team.t()],
          users: [GitHubOpenAPI.SimpleUser.t()]
        }

  defstruct [:__info__, :teams, :users]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [teams: [{GitHubOpenAPI.Team, :t}], users: [{GitHubOpenAPI.SimpleUser, :t}]]
  end
end
