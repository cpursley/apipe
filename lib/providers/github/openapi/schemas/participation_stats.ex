defmodule GitHubOpenAPI.ParticipationStats do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :all, {:array, :integer}
    field :owner, {:array, :integer}
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:all, :owner, :__info__, :__joins__])
    
  end
end
