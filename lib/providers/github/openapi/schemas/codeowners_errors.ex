defmodule GitHubOpenAPI.CodeownersErrors do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :errors, {:array, :string}
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:errors, :__info__, :__joins__])
    
  end
end
