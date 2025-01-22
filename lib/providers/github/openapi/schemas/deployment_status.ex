defmodule GitHubOpenAPI.DeploymentStatus do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :created_at, :string
    field :deployment_url, :string
    field :description, :string
    field :environment, :string
    field :environment_url, :string
    field :id, :integer
    field :log_url, :string
    field :node_id, :string
    field :repository_url, :string
    field :state, Ecto.Enum, values: [:error, :failure, :inactive, :pending, :success, :queued, :in_progress]
    field :target_url, :string
    field :updated_at, :string
    field :url, :string
    embeds_one :creator, GitHubOpenAPI.NullableSimpleUser
    embeds_one :performed_via_github_app, GitHubOpenAPI.NullableIntegration
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:created_at, :deployment_url, :description, :environment, :environment_url, :id, :log_url, :node_id, :repository_url, :state, :target_url, :updated_at, :url, :__info__, :__joins__])
        |> cast_embed(:creator, with: &GitHubOpenAPI.NullableSimpleUser.changeset/2)
    |> cast_embed(:performed_via_github_app, with: &GitHubOpenAPI.NullableIntegration.changeset/2)
  end
end
