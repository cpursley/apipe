defmodule GitHubOpenAPI.OrgHook do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :active, :boolean
    field :config, :map
    field :created_at, :string
    field :deliveries_url, :string
    field :events, {:array, :string}
    field :id, :integer
    field :name, :string
    field :ping_url, :string
    field :type, :string
    field :updated_at, :string
    field :url, :string
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:active, :created_at, :deliveries_url, :events, :id, :name, :ping_url, :type, :updated_at, :url, :__info__, :__joins__])
    
  end
end
