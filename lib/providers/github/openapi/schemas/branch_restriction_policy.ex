defmodule GitHubOpenAPI.BranchRestrictionPolicy do
  @moduledoc """
  Provides struct and type for a BranchRestrictionPolicy
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          apps: [GitHubOpenAPI.BranchRestrictionPolicyApps.t()],
          apps_url: String.t(),
          teams: [GitHubOpenAPI.BranchRestrictionPolicyTeams.t()],
          teams_url: String.t(),
          url: String.t(),
          users: [GitHubOpenAPI.BranchRestrictionPolicyUsers.t()],
          users_url: String.t()
        }

  defstruct [
    :__info__,
    :__joins__,
    :apps,
    :apps_url,
    :teams,
    :teams_url,
    :url,
    :users,
    :users_url
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      apps: [{GitHubOpenAPI.BranchRestrictionPolicyApps, :t}],
      apps_url: {:string, :uri},
      teams: [{GitHubOpenAPI.BranchRestrictionPolicyTeams, :t}],
      teams_url: {:string, :uri},
      url: {:string, :uri},
      users: [{GitHubOpenAPI.BranchRestrictionPolicyUsers, :t}],
      users_url: {:string, :uri}
    ]
  end
end
