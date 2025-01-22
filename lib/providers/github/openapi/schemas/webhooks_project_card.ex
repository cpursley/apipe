defmodule GitHubOpenAPI.WebhooksProjectCard do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :after_id, :integer
    field :archived, :boolean
    field :column_id, :integer
    field :column_url, :string
    field :content_url, :string
    field :created_at, :string
    field :creator, :map
    field :id, :integer
    field :node_id, :string
    field :note, :string
    field :project_url, :string
    field :updated_at, :string
    field :url, :string
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:after_id, :archived, :column_id, :column_url, :content_url, :created_at, :id, :node_id, :note, :project_url, :updated_at, :url, :__info__, :__joins__])
    
  end
end
