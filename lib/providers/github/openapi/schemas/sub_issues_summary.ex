defmodule GitHubOpenAPI.SubIssuesSummary do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :completed, :integer
    field :percent_completed, :integer
    field :total, :integer
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:completed, :percent_completed, :total, :__info__, :__joins__])
    
  end
end
