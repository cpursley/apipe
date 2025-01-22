defmodule GitHubOpenAPI.SecretScanningScan do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :completed_at, :string
    field :started_at, :string
    field :status, :string
    field :type, :string
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:completed_at, :started_at, :status, :type, :__info__, :__joins__])
    
  end
end
