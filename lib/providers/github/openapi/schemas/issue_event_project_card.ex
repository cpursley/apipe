defmodule GitHubOpenAPI.IssueEventProjectCard do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :column_name, :string
    field :id, :integer
    field :previous_column_name, :string
    field :project_id, :integer
    field :project_url, :string
    field :url, :string
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:column_name, :id, :previous_column_name, :project_id, :project_url, :url, :__info__, :__joins__])
    
  end
end
