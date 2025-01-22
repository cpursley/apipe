defmodule GitHubOpenAPI.RepositoryAdvisoryCredit do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :state, Ecto.Enum, values: [:accepted, :declined, :pending]
    embeds_one :type, GitHubOpenAPI.SecurityAdvisoryCreditTypes
    embeds_one :user, GitHubOpenAPI.SimpleUser
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:state, :__info__, :__joins__])
        |> cast_embed(:type, with: &GitHubOpenAPI.SecurityAdvisoryCreditTypes.changeset/2)
    |> cast_embed(:user, with: &GitHubOpenAPI.SimpleUser.changeset/2)
  end
end
