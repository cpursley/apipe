defmodule GitHubOpenAPI.CheckAutomatedSecurityFixes do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :enabled, :boolean
    field :paused, :boolean
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:enabled, :paused, :__info__, :__joins__])
    
  end
end
