defmodule GitHubOpenAPI.ValidationErrorSimple do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :documentation_url, :string
    field :errors, {:array, :string}
    field :message, :string
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:documentation_url, :errors, :message, :__info__, :__joins__])
    
  end
end
