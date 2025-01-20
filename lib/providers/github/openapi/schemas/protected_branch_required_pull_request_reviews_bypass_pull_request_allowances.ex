defmodule GitHubOpenAPI.ProtectedBranchRequiredPullRequestReviewsBypassPullRequestAllowances do
  @moduledoc """
  Provides struct and type for a ProtectedBranchRequiredPullRequestReviewsBypassPullRequestAllowances
  """
  use Apipe.Providers.OpenAPIEncoder

  @type t :: %__MODULE__{
          __info__: map,
          apps: [GitHubOpenAPI.Integration.t() | nil] | nil,
          teams: [GitHubOpenAPI.Team.t()],
          users: [GitHubOpenAPI.SimpleUser.t()]
        }

  defstruct [:__info__, :apps, :teams, :users]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      apps: [union: [{GitHubOpenAPI.Integration, :t}, :null]],
      teams: [{GitHubOpenAPI.Team, :t}],
      users: [{GitHubOpenAPI.SimpleUser, :t}]
    ]
  end
end
