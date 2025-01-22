defmodule GitHubOpenAPI.ReferencedWorkflow do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :path, :string
    field :ref, :string
    field :sha, :string
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:path, :ref, :sha, :__info__, :__joins__])
    
  end
end
