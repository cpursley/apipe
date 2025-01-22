defmodule GitHubOpenAPI.TeamMembership do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :role, Ecto.Enum, values: [:member, :maintainer]
    field :state, Ecto.Enum, values: [:active, :pending]
    field :url, :string
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:role, :state, :url, :__info__, :__joins__])
    
  end
end
