defmodule GitHubOpenAPI.SimpleInstallation do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :id, :integer
    field :node_id, :string
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:id, :node_id, :__info__, :__joins__])
    
  end
end
