defmodule GitHubOpenAPI.ProtectedBranchPullRequestReviewDismissalRestrictions do
  @moduledoc """
  Provides struct and type for a ProtectedBranchPullRequestReviewDismissalRestrictions
  """
  use Apipe.Providers.OpenAPIEncoder

  @type t :: %__MODULE__{
          __info__: map,
          apps: [GitHubOpenAPI.Integration.t() | nil] | nil,
          teams: [GitHubOpenAPI.Team.t()] | nil,
          teams_url: String.t() | nil,
          url: String.t() | nil,
          users: [GitHubOpenAPI.SimpleUser.t()] | nil,
          users_url: String.t() | nil
        }

  defstruct [:__info__, :apps, :teams, :teams_url, :url, :users, :users_url]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      apps: [union: [{GitHubOpenAPI.Integration, :t}, :null]],
      teams: [{GitHubOpenAPI.Team, :t}],
      teams_url: {:string, :generic},
      url: {:string, :generic},
      users: [{GitHubOpenAPI.SimpleUser, :t}],
      users_url: {:string, :generic}
    ]
  end
end
