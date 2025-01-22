defmodule GitHubOpenAPI.OrgPrivateRegistryConfiguration do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :created_at, :string
    field :name, :string
    field :registry_type, Ecto.Enum, values: [:maven_repository]
    field :updated_at, :string
    field :username, :string
    field :visibility, Ecto.Enum, values: [:all, :private, :selected]
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:created_at, :name, :registry_type, :updated_at, :username, :visibility, :__info__, :__joins__])
    
  end
end
