defmodule GitHubOpenAPI.RepositoryCollaboratorPermission do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :permission, :string
    field :role_name, :string
    embeds_one :user, GitHubOpenAPI.NullableCollaborator
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:permission, :role_name, :__info__, :__joins__])
        |> cast_embed(:user, with: &GitHubOpenAPI.NullableCollaborator.changeset/2)
  end
end
