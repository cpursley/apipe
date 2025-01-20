defmodule GitHubOpenAPI.ProtectedBranchRequiredPullRequestReviewsDismissalRestrictions do
  @moduledoc """
  Provides struct and type for a ProtectedBranchRequiredPullRequestReviewsDismissalRestrictions
  """
  use Apipe.Providers.OpenAPIEncoder

  @type t :: %__MODULE__{
          __info__: map,
          apps: [GitHubOpenAPI.Integration.t() | nil] | nil,
          teams: [GitHubOpenAPI.Team.t()],
          teams_url: String.t(),
          url: String.t(),
          users: [GitHubOpenAPI.SimpleUser.t()],
          users_url: String.t()
        }

  defstruct [:__info__, :apps, :teams, :teams_url, :url, :users, :users_url]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      apps: [union: [{GitHubOpenAPI.Integration, :t}, :null]],
      teams: [{GitHubOpenAPI.Team, :t}],
      teams_url: {:string, :uri},
      url: {:string, :uri},
      users: [{GitHubOpenAPI.SimpleUser, :t}],
      users_url: {:string, :uri}
    ]
  end
end
