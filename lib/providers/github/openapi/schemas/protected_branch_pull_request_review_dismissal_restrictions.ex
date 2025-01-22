defmodule GitHubOpenAPI.ProtectedBranchPullRequestReviewDismissalRestrictions do
  @moduledoc """
  Provides struct and type for a ProtectedBranchPullRequestReviewDismissalRestrictions
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          apps: [GitHubOpenAPI.Integration.t()] | nil,
          teams: [GitHubOpenAPI.Team.t()] | nil,
          teams_url: String.t() | nil,
          url: String.t() | nil,
          users: [GitHubOpenAPI.SimpleUser.t()] | nil,
          users_url: String.t() | nil
        }

  defstruct [:__info__, :__joins__, :apps, :teams, :teams_url, :url, :users, :users_url]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      apps: [{GitHubOpenAPI.Integration, :t}],
      teams: [{GitHubOpenAPI.Team, :t}],
      teams_url: {:string, :generic},
      url: {:string, :generic},
      users: [{GitHubOpenAPI.SimpleUser, :t}],
      users_url: {:string, :generic}
    ]
  end
end
