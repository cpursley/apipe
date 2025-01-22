defmodule GitHubOpenAPI.ActionsCacheUsageOrgEnterprise do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :total_active_caches_count, :integer
    field :total_active_caches_size_in_bytes, :integer
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:total_active_caches_count, :total_active_caches_size_in_bytes, :__info__, :__joins__])
    
  end
end
