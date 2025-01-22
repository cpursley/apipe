defmodule GitHubOpenAPI.CheckSuite do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :after, :string
    field :before, :string
    field :check_runs_url, :string
    field :conclusion, Ecto.Enum, values: [:success, :failure, :neutral, :cancelled, :skipped, :timed_out, :action_required, :startup_failure, :stale]
    field :created_at, :string
    field :head_branch, :string
    field :head_sha, :string
    field :id, :integer
    field :latest_check_runs_count, :integer
    field :node_id, :string
    field :rerequestable, :boolean
    field :runs_rerequestable, :boolean
    field :status, Ecto.Enum, values: [:queued, :in_progress, :completed, :waiting, :requested, :pending]
    field :updated_at, :string
    field :url, :string
    embeds_one :app, GitHubOpenAPI.NullableIntegration
    embeds_one :head_commit, GitHubOpenAPI.SimpleCommit
    embeds_many :pull_requests, GitHubOpenAPI.PullRequestMinimal
    embeds_one :repository, GitHubOpenAPI.MinimalRepository
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:after, :before, :check_runs_url, :conclusion, :created_at, :head_branch, :head_sha, :id, :latest_check_runs_count, :node_id, :rerequestable, :runs_rerequestable, :status, :updated_at, :url, :__info__, :__joins__])
        |> cast_embed(:app, with: &GitHubOpenAPI.NullableIntegration.changeset/2)
    |> cast_embed(:head_commit, with: &GitHubOpenAPI.SimpleCommit.changeset/2)
    |> cast_embed(:pull_requests, with: &GitHubOpenAPI.PullRequestMinimal.changeset/2)
    |> cast_embed(:repository, with: &GitHubOpenAPI.MinimalRepository.changeset/2)
  end
end
