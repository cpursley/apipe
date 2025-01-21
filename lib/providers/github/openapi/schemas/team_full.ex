defmodule GitHubOpenAPI.TeamFull do
  @moduledoc """
  Provides struct and type for a TeamFull
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          created_at: DateTime.t(),
          description: String.t() | nil,
          html_url: String.t(),
          id: integer,
          ldap_dn: String.t() | nil,
          members_count: integer,
          members_url: String.t(),
          name: String.t(),
          node_id: String.t(),
          notification_setting: String.t() | nil,
          organization: GitHubOpenAPI.TeamOrganization.t(),
          parent: GitHubOpenAPI.TeamSimple.t() | nil,
          permission: String.t(),
          privacy: String.t() | nil,
          repos_count: integer,
          repositories_url: String.t(),
          slug: String.t(),
          updated_at: DateTime.t(),
          url: String.t()
        }

  defstruct [
    :__info__,
    :__joins__,
    :created_at,
    :description,
    :html_url,
    :id,
    :ldap_dn,
    :members_count,
    :members_url,
    :name,
    :node_id,
    :notification_setting,
    :organization,
    :parent,
    :permission,
    :privacy,
    :repos_count,
    :repositories_url,
    :slug,
    :updated_at,
    :url
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      created_at: {:string, :date_time},
      description: {:union, [{:string, :generic}, :null]},
      html_url: {:string, :uri},
      id: :integer,
      ldap_dn: {:string, :generic},
      members_count: :integer,
      members_url: {:string, :generic},
      name: {:string, :generic},
      node_id: {:string, :generic},
      notification_setting: {:enum, ["notifications_enabled", "notifications_disabled"]},
      organization: {GitHubOpenAPI.TeamOrganization, :t},
      parent: {:union, [{GitHubOpenAPI.TeamSimple, :t}, :null]},
      permission: {:string, :generic},
      privacy: {:enum, ["closed", "secret"]},
      repos_count: :integer,
      repositories_url: {:string, :uri},
      slug: {:string, :generic},
      updated_at: {:string, :date_time},
      url: {:string, :uri}
    ]
  end
end
