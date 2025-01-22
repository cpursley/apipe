defmodule GitHubOpenAPI.WebhooksTeam1 do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :deleted, :boolean
    field :description, :string
    field :html_url, :string
    field :id, :integer
    field :members_url, :string
    field :name, :string
    field :node_id, :string
    field :notification_setting, Ecto.Enum, values: [:notifications_enabled, :notifications_disabled]
    field :parent, :map
    field :permission, :string
    field :privacy, Ecto.Enum, values: [:open, :closed, :secret]
    field :repositories_url, :string
    field :slug, :string
    field :url, :string
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:deleted, :description, :html_url, :id, :members_url, :name, :node_id, :notification_setting, :permission, :privacy, :repositories_url, :slug, :url, :__info__, :__joins__])
    
  end
end
