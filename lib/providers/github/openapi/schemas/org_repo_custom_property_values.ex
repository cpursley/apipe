defmodule GitHubOpenAPI.OrgRepoCustomPropertyValues do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :repository_full_name, :string
    field :repository_id, :integer
    field :repository_name, :string
    embeds_many :properties, GitHubOpenAPI.CustomPropertyValue
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:repository_full_name, :repository_id, :repository_name, :__info__, :__joins__])
        |> cast_embed(:properties, with: &GitHubOpenAPI.CustomPropertyValue.changeset/2)
  end
end
