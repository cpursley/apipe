defmodule GitHubOpenAPI.OrgMembership do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :organization_url, :string
    field :permissions, :map
    field :role, Ecto.Enum, values: [:admin, :member, :billing_manager]
    field :state, Ecto.Enum, values: [:active, :pending]
    field :url, :string
    embeds_one :organization, GitHubOpenAPI.OrganizationSimple
    embeds_one :user, GitHubOpenAPI.NullableSimpleUser
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:organization_url, :role, :state, :url, :__info__, :__joins__])
        |> cast_embed(:organization, with: &GitHubOpenAPI.OrganizationSimple.changeset/2)
    |> cast_embed(:user, with: &GitHubOpenAPI.NullableSimpleUser.changeset/2)
  end
end
