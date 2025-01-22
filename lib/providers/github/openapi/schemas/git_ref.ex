defmodule GitHubOpenAPI.GitRef do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :node_id, :string
    field :object, :map
    field :ref, :string
    field :url, :string
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:node_id, :ref, :url, :__info__, :__joins__])
    
  end
end
