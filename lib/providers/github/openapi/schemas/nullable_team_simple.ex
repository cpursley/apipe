defmodule GitHubOpenAPI.NullableTeamSimple do
  @moduledoc """
  Provides struct and type for a NullableTeamSimple
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          description: String.t() | nil,
          html_url: String.t(),
          id: integer,
          ldap_dn: String.t() | nil,
          members_url: String.t(),
          name: String.t(),
          node_id: String.t(),
          notification_setting: String.t() | nil,
          permission: String.t(),
          privacy: String.t() | nil,
          repositories_url: String.t(),
          slug: String.t(),
          url: String.t()
        }

  defstruct [
    :__info__,
    :__joins__,
    :description,
    :html_url,
    :id,
    :ldap_dn,
    :members_url,
    :name,
    :node_id,
    :notification_setting,
    :permission,
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
      description: {:string, :generic},
      html_url: {:string, :uri},
      id: :integer,
      ldap_dn: {:string, :generic},
      members_url: {:string, :generic},
      name: {:string, :generic},
      node_id: {:string, :generic},
      notification_setting: {:string, :generic},
      permission: {:string, :generic},
      privacy: {:string, :generic},
      repositories_url: {:string, :uri},
      slug: {:string, :generic},
      url: {:string, :uri}
    ]
  end
end
