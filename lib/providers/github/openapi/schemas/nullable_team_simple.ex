defmodule GitHubOpenAPI.NullableTeamSimple do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :description, :string
    field :html_url, :string
    field :id, :integer
    field :ldap_dn, :string
    field :members_url, :string
    field :name, :string
    field :node_id, :string
    field :notification_setting, :string
    field :permission, :string
    field :privacy, :string
    field :repositories_url, :string
    field :slug, :string
    field :url, :string
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:description, :html_url, :id, :ldap_dn, :members_url, :name, :node_id, :notification_setting, :permission, :privacy, :repositories_url, :slug, :url, :__info__, :__joins__])
    
  end
end
