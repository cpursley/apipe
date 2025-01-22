defmodule GitHubOpenAPI.SimpleCommit do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :author, :map
    field :committer, :map
    field :id, :string
    field :message, :string
    field :timestamp, :string
    field :tree_id, :string
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:id, :message, :timestamp, :tree_id, :__info__, :__joins__])
    
  end
end
