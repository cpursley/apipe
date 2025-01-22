defmodule GitHubOpenAPI.ProtectedBranchPullRequestReviewBypassPullRequestAllowances do
  @moduledoc """
  Provides struct and type for a ProtectedBranchPullRequestReviewBypassPullRequestAllowances
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          apps: [GitHubOpenAPI.Integration.t()] | nil,
          teams: [GitHubOpenAPI.Team.t()] | nil,
          users: [GitHubOpenAPI.SimpleUser.t()] | nil
        }

  defstruct [:__info__, :__joins__, :apps, :teams, :users]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      apps: [{GitHubOpenAPI.Integration, :t}],
      teams: [{GitHubOpenAPI.Team, :t}],
      users: [{GitHubOpenAPI.SimpleUser, :t}]
    ]
  end
end
