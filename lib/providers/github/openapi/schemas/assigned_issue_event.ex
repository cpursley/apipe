defmodule GitHubOpenAPI.AssignedIssueEvent do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :commit_id, :string
    field :commit_url, :string
    field :created_at, :string
    field :event, :string
    field :id, :integer
    field :node_id, :string
    field :url, :string
    embeds_one :actor, GitHubOpenAPI.SimpleUser
    embeds_one :assignee, GitHubOpenAPI.SimpleUser
    embeds_one :assigner, GitHubOpenAPI.SimpleUser
    embeds_one :performed_via_github_app, GitHubOpenAPI.Integration
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:commit_id, :commit_url, :created_at, :event, :id, :node_id, :url, :__info__, :__joins__])
        |> cast_embed(:actor, with: &GitHubOpenAPI.SimpleUser.changeset/2)
    |> cast_embed(:assignee, with: &GitHubOpenAPI.SimpleUser.changeset/2)
    |> cast_embed(:assigner, with: &GitHubOpenAPI.SimpleUser.changeset/2)
    |> cast_embed(:performed_via_github_app, with: &GitHubOpenAPI.Integration.changeset/2)
  end
end
