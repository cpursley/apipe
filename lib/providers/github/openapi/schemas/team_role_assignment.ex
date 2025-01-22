defmodule GitHubOpenAPI.TeamRoleAssignment do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :assignment, Ecto.Enum, values: [:direct, :indirect, :mixed]
    field :description, :string
    field :html_url, :string
    field :id, :integer
    field :members_url, :string
    field :name, :string
    field :node_id, :string
    field :notification_setting, :string
    field :permission, :string
    field :permissions, :map
    field :privacy, :string
    field :repositories_url, :string
    field :slug, :string
    field :url, :string
    embeds_one :parent, GitHubOpenAPI.NullableTeamSimple
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:assignment, :description, :html_url, :id, :members_url, :name, :node_id, :notification_setting, :permission, :privacy, :repositories_url, :slug, :url, :__info__, :__joins__])
        |> cast_embed(:parent, with: &GitHubOpenAPI.NullableTeamSimple.changeset/2)
  end
end
