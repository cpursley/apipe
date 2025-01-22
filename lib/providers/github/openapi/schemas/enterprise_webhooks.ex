defmodule GitHubOpenAPI.EnterpriseWebhooks do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :avatar_url, :string
    field :created_at, :string
    field :description, :string
    field :html_url, :string
    field :id, :integer
    field :name, :string
    field :node_id, :string
    field :slug, :string
    field :updated_at, :string
    field :website_url, :string
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:avatar_url, :created_at, :description, :html_url, :id, :name, :node_id, :slug, :updated_at, :website_url, :__info__, :__joins__])
    
  end
end
