defmodule GitHubOpenAPI.WebhookRubygemsMetadata do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :commit_oid, :string
    field :dependencies, {:array, :string}
    field :description, :string
    field :homepage, :string
    field :metadata, {:map, :string}
    field :name, :string
    field :platform, :string
    field :readme, :string
    field :repo, :string
    field :version_info, :map
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:commit_oid, :dependencies, :description, :homepage, :name, :platform, :readme, :repo, :__info__, :__joins__])
    
  end
end
