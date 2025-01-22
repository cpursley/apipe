defmodule GitHubOpenAPI.ProjectsV2IterationSetting do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :duration, :float
    field :id, :string
    field :start_date, :string
    field :title, :string
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:duration, :id, :start_date, :title, :__info__, :__joins__])
    
  end
end
