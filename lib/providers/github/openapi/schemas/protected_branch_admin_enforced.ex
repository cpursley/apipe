defmodule GitHubOpenAPI.ProtectedBranchAdminEnforced do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :enabled, :boolean
    field :url, :string
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:enabled, :url, :__info__, :__joins__])
    
  end
end
