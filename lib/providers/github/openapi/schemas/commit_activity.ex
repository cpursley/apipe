defmodule GitHubOpenAPI.CommitActivity do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :days, {:array, :integer}
    field :total, :integer
    field :week, :integer
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:days, :total, :week, :__info__, :__joins__])
    
  end
end
