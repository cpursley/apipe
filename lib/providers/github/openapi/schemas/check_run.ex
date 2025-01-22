defmodule GitHubOpenAPI.CheckRun do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :check_suite, :map
    field :completed_at, :string
    field :conclusion, Ecto.Enum, values: [:success, :failure, :neutral, :cancelled, :skipped, :timed_out, :action_required]
    field :details_url, :string
    field :external_id, :string
    field :head_sha, :string
    field :html_url, :string
    field :id, :integer
    field :name, :string
    field :node_id, :string
    field :output, :map
    field :started_at, :string
    field :status, Ecto.Enum, values: [:queued, :in_progress, :completed, :waiting, :requested, :pending]
    field :url, :string
    embeds_one :app, GitHubOpenAPI.NullableIntegration
    embeds_one :deployment, GitHubOpenAPI.DeploymentSimple
    embeds_many :pull_requests, GitHubOpenAPI.PullRequestMinimal
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:completed_at, :conclusion, :details_url, :external_id, :head_sha, :html_url, :id, :name, :node_id, :started_at, :status, :url, :__info__, :__joins__])
        |> cast_embed(:app, with: &GitHubOpenAPI.NullableIntegration.changeset/2)
    |> cast_embed(:deployment, with: &GitHubOpenAPI.DeploymentSimple.changeset/2)
    |> cast_embed(:pull_requests, with: &GitHubOpenAPI.PullRequestMinimal.changeset/2)
  end
end
