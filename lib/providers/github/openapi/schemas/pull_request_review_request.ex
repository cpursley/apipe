defmodule GitHubOpenAPI.PullRequestReviewRequest do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    embeds_many :teams, GitHubOpenAPI.Team
    embeds_many :users, GitHubOpenAPI.SimpleUser
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:__info__, :__joins__])
        |> cast_embed(:teams, with: &GitHubOpenAPI.Team.changeset/2)
    |> cast_embed(:users, with: &GitHubOpenAPI.SimpleUser.changeset/2)
  end
end
