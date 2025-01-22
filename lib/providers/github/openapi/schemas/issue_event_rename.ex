defmodule GitHubOpenAPI.IssueEventRename do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :from, :string
    field :to, :string
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:from, :to, :__info__, :__joins__])
    
  end
end
