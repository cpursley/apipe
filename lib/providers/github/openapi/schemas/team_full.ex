defmodule GitHubOpenAPI.TeamFull do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :created_at, :string
    field :description, :string
    field :html_url, :string
    field :id, :integer
    field :ldap_dn, :string
    field :members_count, :integer
    field :members_url, :string
    field :name, :string
    field :node_id, :string
    field :notification_setting, Ecto.Enum, values: [:notifications_enabled, :notifications_disabled]
    field :permission, :string
    field :privacy, Ecto.Enum, values: [:closed, :secret]
    field :repos_count, :integer
    field :repositories_url, :string
    field :slug, :string
    field :updated_at, :string
    field :url, :string
    embeds_one :organization, GitHubOpenAPI.TeamOrganization
    embeds_one :parent, GitHubOpenAPI.NullableTeamSimple
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:created_at, :description, :html_url, :id, :ldap_dn, :members_count, :members_url, :name, :node_id, :notification_setting, :permission, :privacy, :repos_count, :repositories_url, :slug, :updated_at, :url, :__info__, :__joins__])
        |> cast_embed(:organization, with: &GitHubOpenAPI.TeamOrganization.changeset/2)
    |> cast_embed(:parent, with: &GitHubOpenAPI.NullableTeamSimple.changeset/2)
  end
end
