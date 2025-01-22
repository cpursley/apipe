defmodule GitHubOpenAPI.DeployKey do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :added_by, :string
    field :created_at, :string
    field :enabled, :boolean
    field :id, :integer
    field :key, :string
    field :last_used, :string
    field :read_only, :boolean
    field :title, :string
    field :url, :string
    field :verified, :boolean
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:added_by, :created_at, :enabled, :id, :key, :last_used, :read_only, :title, :url, :verified, :__info__, :__joins__])
    
  end
end
