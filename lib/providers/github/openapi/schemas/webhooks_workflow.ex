defmodule GitHubOpenAPI.WebhooksWorkflow do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :badge_url, :string
    field :created_at, :string
    field :html_url, :string
    field :id, :integer
    field :name, :string
    field :node_id, :string
    field :path, :string
    field :state, :string
    field :updated_at, :string
    field :url, :string
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:badge_url, :created_at, :html_url, :id, :name, :node_id, :path, :state, :updated_at, :url, :__info__, :__joins__])
    
  end
end
