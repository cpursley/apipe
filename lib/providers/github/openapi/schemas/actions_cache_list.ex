defmodule GitHubOpenAPI.ActionsCacheList do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :actions_caches, {:array, :string}
    field :total_count, :integer
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:actions_caches, :total_count, :__info__, :__joins__])
    
  end
end
