defmodule GitHubOpenAPI.CodeScanningAlertLocation do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :end_column, :integer
    field :end_line, :integer
    field :path, :string
    field :start_column, :integer
    field :start_line, :integer
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:end_column, :end_line, :path, :start_column, :start_line, :__info__, :__joins__])
    
  end
end
