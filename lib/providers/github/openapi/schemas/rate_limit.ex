defmodule GitHubOpenAPI.RateLimit do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :limit, :integer
    field :remaining, :integer
    field :reset, :integer
    field :used, :integer
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:limit, :remaining, :reset, :used, :__info__, :__joins__])
    
  end
end
