defmodule GitHubOpenAPI.Artifact do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :archive_download_url, :string
    field :created_at, :string
    field :expired, :boolean
    field :expires_at, :string
    field :id, :integer
    field :name, :string
    field :node_id, :string
    field :size_in_bytes, :integer
    field :updated_at, :string
    field :url, :string
    field :workflow_run, :map
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:archive_download_url, :created_at, :expired, :expires_at, :id, :name, :node_id, :size_in_bytes, :updated_at, :url, :__info__, :__joins__])
    
  end
end
