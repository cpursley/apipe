defmodule GitHubOpenAPI.SecretScanningLocationCommit do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :blob_sha, :string
    field :blob_url, :string
    field :commit_sha, :string
    field :commit_url, :string
    field :end_column, :float
    field :end_line, :float
    field :path, :string
    field :start_column, :float
    field :start_line, :float
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:blob_sha, :blob_url, :commit_sha, :commit_url, :end_column, :end_line, :path, :start_column, :start_line, :__info__, :__joins__])
    
  end
end
