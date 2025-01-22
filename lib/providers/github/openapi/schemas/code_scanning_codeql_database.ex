defmodule GitHubOpenAPI.CodeScanningCodeqlDatabase do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :commit_oid, :string
    field :content_type, :string
    field :created_at, :string
    field :id, :integer
    field :language, :string
    field :name, :string
    field :size, :integer
    field :updated_at, :string
    field :url, :string
    embeds_one :uploader, GitHubOpenAPI.SimpleUser
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:commit_oid, :content_type, :created_at, :id, :language, :name, :size, :updated_at, :url, :__info__, :__joins__])
        |> cast_embed(:uploader, with: &GitHubOpenAPI.SimpleUser.changeset/2)
  end
end
