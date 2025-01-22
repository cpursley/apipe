defmodule GitHubOpenAPI.PorterLargeFile do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :oid, :string
    field :path, :string
    field :ref_name, :string
    field :size, :integer
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:oid, :path, :ref_name, :size, :__info__, :__joins__])
    
  end
end
