defmodule GitHubOpenAPI.ActionsCacheUsageByRepository do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :active_caches_count, :integer
    field :active_caches_size_in_bytes, :integer
    field :full_name, :string
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:active_caches_count, :active_caches_size_in_bytes, :full_name, :__info__, :__joins__])
    
  end
end
