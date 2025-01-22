defmodule GitHubOpenAPI.OrganizationRole do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :base_role, Ecto.Enum, values: [:read, :triage, :write, :maintain, :admin]
    field :created_at, :string
    field :description, :string
    field :id, :integer
    field :name, :string
    field :permissions, {:array, :string}
    field :source, Ecto.Enum, values: [:"Organization", :"Enterprise", :"Predefined"]
    field :updated_at, :string
    embeds_one :organization, GitHubOpenAPI.NullableSimpleUser
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:base_role, :created_at, :description, :id, :name, :permissions, :source, :updated_at, :__info__, :__joins__])
        |> cast_embed(:organization, with: &GitHubOpenAPI.NullableSimpleUser.changeset/2)
  end
end
