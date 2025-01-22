defmodule GitHubOpenAPI.PackageVersion do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :created_at, :string
    field :deleted_at, :string
    field :description, :string
    field :html_url, :string
    field :id, :integer
    field :license, :string
    field :metadata, :map
    field :name, :string
    field :package_html_url, :string
    field :updated_at, :string
    field :url, :string
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:created_at, :deleted_at, :description, :html_url, :id, :license, :name, :package_html_url, :updated_at, :url, :__info__, :__joins__])
    
  end
end
