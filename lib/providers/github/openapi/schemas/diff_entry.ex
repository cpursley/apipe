defmodule GitHubOpenAPI.DiffEntry do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :additions, :integer
    field :blob_url, :string
    field :changes, :integer
    field :contents_url, :string
    field :deletions, :integer
    field :filename, :string
    field :patch, :string
    field :previous_filename, :string
    field :raw_url, :string
    field :sha, :string
    field :status, Ecto.Enum, values: [:added, :removed, :modified, :renamed, :copied, :changed, :unchanged]
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:additions, :blob_url, :changes, :contents_url, :deletions, :filename, :patch, :previous_filename, :raw_url, :sha, :status, :__info__, :__joins__])
    
  end
end
