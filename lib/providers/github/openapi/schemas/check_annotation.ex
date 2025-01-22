defmodule GitHubOpenAPI.CheckAnnotation do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :annotation_level, :string
    field :blob_href, :string
    field :end_column, :integer
    field :end_line, :integer
    field :message, :string
    field :path, :string
    field :raw_details, :string
    field :start_column, :integer
    field :start_line, :integer
    field :title, :string
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:annotation_level, :blob_href, :end_column, :end_line, :message, :path, :raw_details, :start_column, :start_line, :title, :__info__, :__joins__])
    
  end
end
