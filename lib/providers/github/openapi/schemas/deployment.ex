defmodule GitHubOpenAPI.Deployment do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :created_at, :string
    field :description, :string
    field :environment, :string
    field :id, :integer
    field :node_id, :string
    field :original_environment, :string
    field :payload, :map
    field :production_environment, :boolean
    field :ref, :string
    field :repository_url, :string
    field :sha, :string
    field :statuses_url, :string
    field :task, :string
    field :transient_environment, :boolean
    field :updated_at, :string
    field :url, :string
    embeds_one :creator, GitHubOpenAPI.NullableSimpleUser
    embeds_one :performed_via_github_app, GitHubOpenAPI.NullableIntegration
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:created_at, :description, :environment, :id, :node_id, :original_environment, :payload, :production_environment, :ref, :repository_url, :sha, :statuses_url, :task, :transient_environment, :updated_at, :url, :__info__, :__joins__])
        |> cast_embed(:creator, with: &GitHubOpenAPI.NullableSimpleUser.changeset/2)
    |> cast_embed(:performed_via_github_app, with: &GitHubOpenAPI.NullableIntegration.changeset/2)
  end
end
