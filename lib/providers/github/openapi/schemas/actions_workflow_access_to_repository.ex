defmodule GitHubOpenAPI.ActionsWorkflowAccessToRepository do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :access_level, Ecto.Enum, values: [:none, :user, :organization]
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:access_level, :__info__, :__joins__])
    
  end
end
