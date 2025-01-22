defmodule GitHubOpenAPI.ScimError do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :detail, :string
    field :documentation_url, :string
    field :message, :string
    field :schemas, {:array, :string}
    field :scim_type, :string
    field :status, :integer
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:detail, :documentation_url, :message, :schemas, :scim_type, :status, :__info__, :__joins__])
    
  end
end
