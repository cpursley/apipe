defmodule GitHubOpenAPI.EnvironmentApprovals do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :comment, :string
    field :environments, {:array, :string}
    field :state, Ecto.Enum, values: [:approved, :rejected, :pending]
    embeds_one :user, GitHubOpenAPI.SimpleUser
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:comment, :environments, :state, :__info__, :__joins__])
        |> cast_embed(:user, with: &GitHubOpenAPI.SimpleUser.changeset/2)
  end
end
