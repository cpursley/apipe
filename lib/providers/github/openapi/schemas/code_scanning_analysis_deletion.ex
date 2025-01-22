defmodule GitHubOpenAPI.CodeScanningAnalysisDeletion do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :confirm_delete_url, :string
    field :next_analysis_url, :string
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:confirm_delete_url, :next_analysis_url, :__info__, :__joins__])
    
  end
end
