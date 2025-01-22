defmodule GitHubOpenAPI.CodespacesPermissionsCheckForDevcontainer do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :accepted, :boolean
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:accepted, :__info__, :__joins__])
    
  end
end
