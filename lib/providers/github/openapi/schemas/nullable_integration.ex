defmodule GitHubOpenAPI.NullableIntegration do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :client_id, :string
    field :client_secret, :string
    field :created_at, :string
    field :description, :string
    field :events, {:array, :string}
    field :external_url, :string
    field :html_url, :string
    field :id, :integer
    field :installations_count, :integer
    field :name, :string
    field :node_id, :string
    field :owner, :map
    field :pem, :string
    field :permissions, {:map, :string}
    field :slug, :string
    field :updated_at, :string
    field :webhook_secret, :string
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:client_id, :client_secret, :created_at, :description, :events, :external_url, :html_url, :id, :installations_count, :name, :node_id, :owner, :pem, :slug, :updated_at, :webhook_secret, :__info__, :__joins__])
    
  end
end
