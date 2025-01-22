defmodule GitHubOpenAPI.WorkflowRunUsage do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :billable, :map
    field :run_duration_ms, :integer
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:run_duration_ms, :__info__, :__joins__])
    
  end
end
