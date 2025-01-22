defmodule GitHubOpenAPI.HookDelivery do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :action, :string
    field :delivered_at, :string
    field :duration, :float
    field :event, :string
    field :guid, :string
    field :id, :integer
    field :installation_id, :integer
    field :redelivery, :boolean
    field :repository_id, :integer
    field :request, :map
    field :response, :map
    field :status, :string
    field :status_code, :integer
    field :throttled_at, :string
    field :url, :string
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:action, :delivered_at, :duration, :event, :guid, :id, :installation_id, :redelivery, :repository_id, :status, :status_code, :throttled_at, :url, :__info__, :__joins__])
    
  end
end
