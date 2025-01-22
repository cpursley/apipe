defmodule GitHubOpenAPI.WebhooksProject do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :body, :string
    field :columns_url, :string
    field :created_at, :string
    field :creator, :map
    field :html_url, :string
    field :id, :integer
    field :name, :string
    field :node_id, :string
    field :number, :integer
    field :owner_url, :string
    field :state, Ecto.Enum, values: [:open, :closed]
    field :updated_at, :string
    field :url, :string
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:body, :columns_url, :created_at, :html_url, :id, :name, :node_id, :number, :owner_url, :state, :updated_at, :url, :__info__, :__joins__])
    
  end
end
