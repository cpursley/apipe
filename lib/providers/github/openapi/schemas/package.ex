defmodule GitHubOpenAPI.Package do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :created_at, :string
    field :html_url, :string
    field :id, :integer
    field :name, :string
    field :package_type, Ecto.Enum, values: [:npm, :maven, :rubygems, :docker, :nuget, :container]
    field :updated_at, :string
    field :url, :string
    field :version_count, :integer
    field :visibility, Ecto.Enum, values: [:private, :public]
    embeds_one :owner, GitHubOpenAPI.NullableSimpleUser
    embeds_one :repository, GitHubOpenAPI.NullableMinimalRepository
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:created_at, :html_url, :id, :name, :package_type, :updated_at, :url, :version_count, :visibility, :__info__, :__joins__])
        |> cast_embed(:owner, with: &GitHubOpenAPI.NullableSimpleUser.changeset/2)
    |> cast_embed(:repository, with: &GitHubOpenAPI.NullableMinimalRepository.changeset/2)
  end
end
