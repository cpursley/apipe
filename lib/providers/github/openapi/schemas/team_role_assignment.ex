defmodule GitHubOpenAPI.TeamRoleAssignment do
  @moduledoc """
  Provides struct and type for a TeamRoleAssignment
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          assignment: String.t() | nil,
          description: String.t() | nil,
          html_url: String.t(),
          id: integer,
          members_url: String.t(),
          name: String.t(),
          node_id: String.t(),
          notification_setting: String.t() | nil,
          parent: GitHubOpenAPI.NullableTeamSimple.t(),
          permission: String.t(),
          permissions: GitHubOpenAPI.TeamRoleAssignmentPermissions.t() | nil,
          privacy: String.t() | nil,
          repositories_url: String.t(),
          slug: String.t(),
          url: String.t()
        }

  defstruct [
    :__info__,
    :__joins__,
    :assignment,
    :description,
    :html_url,
    :id,
    :members_url,
    :name,
    :node_id,
    :notification_setting,
    :parent,
    :permission,
    :permissions,
    :privacy,
    :repositories_url,
    :slug,
    :url
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      assignment: {:enum, ["direct", "indirect", "mixed"]},
      description: {:string, :generic},
      html_url: {:string, :uri},
      id: :integer,
      members_url: {:string, :generic},
      name: {:string, :generic},
      node_id: {:string, :generic},
      notification_setting: {:string, :generic},
      parent: {GitHubOpenAPI.NullableTeamSimple, :t},
      permission: {:string, :generic},
      permissions: {GitHubOpenAPI.TeamRoleAssignmentPermissions, :t},
      privacy: {:string, :generic},
      repositories_url: {:string, :uri},
      slug: {:string, :generic},
      url: {:string, :uri}
    ]
  end
end
