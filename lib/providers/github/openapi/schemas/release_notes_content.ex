defmodule GitHubOpenAPI.ReleaseNotesContent do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :body, :string
    field :name, :string
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:body, :name, :__info__, :__joins__])
    
  end
end
