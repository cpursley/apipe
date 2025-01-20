defmodule GitHubOpenAPI.PendingDeploymentReviewers do
  @moduledoc """
  Provides struct and type for a PendingDeploymentReviewers
  """
  use Apipe.Providers.OpenAPIEncoder

  @type t :: %__MODULE__{
          __info__: map,
          reviewer: GitHubOpenAPI.SimpleUser.t() | GitHubOpenAPI.Team.t() | nil,
          type: String.t() | nil
        }

  defstruct [:__info__, :reviewer, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      reviewer: {:union, [{GitHubOpenAPI.SimpleUser, :t}, {GitHubOpenAPI.Team, :t}]},
      type: {:enum, ["User", "Team"]}
    ]
  end
end
