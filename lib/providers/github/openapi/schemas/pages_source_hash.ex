defmodule GitHubOpenAPI.PagesSourceHash do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :branch, :string
    field :path, :string
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:branch, :path, :__info__, :__joins__])
    
  end
end
