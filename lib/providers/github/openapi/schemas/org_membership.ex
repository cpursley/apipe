defmodule GitHubOpenAPI.OrgMembership do
  @moduledoc """
  Provides struct and type for a OrgMembership
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          organization: GitHubOpenAPI.OrganizationSimple.t(),
          organization_url: String.t(),
          permissions: GitHubOpenAPI.OrgMembershipPermissions.t() | nil,
          role: String.t(),
          state: String.t(),
          url: String.t(),
          user: GitHubOpenAPI.NullableSimpleUser.t()
        }

  defstruct [
    :__info__,
    :__joins__,
    :organization,
    :organization_url,
    :permissions,
    :role,
    :state,
    :url,
    :user
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      organization: {GitHubOpenAPI.OrganizationSimple, :t},
      organization_url: {:string, :uri},
      permissions: {GitHubOpenAPI.OrgMembershipPermissions, :t},
      role: {:enum, ["admin", "member", "billing_manager"]},
      state: {:enum, ["active", "pending"]},
      url: {:string, :uri},
      user: {GitHubOpenAPI.NullableSimpleUser, :t}
    ]
  end
end
