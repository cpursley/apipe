defmodule GitHubOpenAPI.CodespaceExportDetails do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :branch, :string
    field :completed_at, :string
    field :export_url, :string
    field :html_url, :string
    field :id, :string
    field :sha, :string
    field :state, :string
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:branch, :completed_at, :export_url, :html_url, :id, :sha, :state, :__info__, :__joins__])
    
  end
end
