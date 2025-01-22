defmodule GitHubOpenAPI.WorkflowRun do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :display_title, :string
    field :name, :string
    field :check_suite_node_id, :string
    field :workflow_id, :integer
    field :logs_url, :string
    field :head_branch, :string
    field :run_attempt, :integer
    field :path, :string
    field :workflow_url, :string
    field :artifacts_url, :string
    field :conclusion, :string
    field :check_suite_url, :string
    field :event, :string
    field :html_url, :string
    field :created_at, :string
    field :updated_at, :string
    field :run_started_at, :string
    field :jobs_url, :string
    field :url, :string
    field :rerun_url, :string
    field :cancel_url, :string
    field :check_suite_id, :integer
    field :node_id, :string
    field :head_sha, :string
    field :status, :string
    field :head_repository_id, :integer
    field :id, :integer
    field :previous_attempt_url, :string
    field :run_number, :integer
    embeds_many :pull_requests, GitHubOpenAPI.PullRequestMinimal
    embeds_one :repository, GitHubOpenAPI.MinimalRepository
    embeds_one :head_commit, GitHubOpenAPI.NullableSimpleCommit
    embeds_many :referenced_workflows, GitHubOpenAPI.ReferencedWorkflow
    embeds_one :triggering_actor, GitHubOpenAPI.SimpleUser
    embeds_one :actor, GitHubOpenAPI.SimpleUser
    embeds_one :head_repository, GitHubOpenAPI.MinimalRepository
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:display_title, :name, :check_suite_node_id, :workflow_id, :logs_url, :head_branch, :run_attempt, :path, :workflow_url, :artifacts_url, :conclusion, :check_suite_url, :event, :html_url, :created_at, :updated_at, :run_started_at, :jobs_url, :url, :rerun_url, :cancel_url, :check_suite_id, :node_id, :head_sha, :status, :head_repository_id, :id, :previous_attempt_url, :run_number, :__info__, :__joins__])
        |> cast_embed(:pull_requests, with: &GitHubOpenAPI.PullRequestMinimal.changeset/2)
    |> cast_embed(:repository, with: &GitHubOpenAPI.MinimalRepository.changeset/2)
    |> cast_embed(:head_commit, with: &GitHubOpenAPI.NullableSimpleCommit.changeset/2)
    |> cast_embed(:referenced_workflows, with: &GitHubOpenAPI.ReferencedWorkflow.changeset/2)
    |> cast_embed(:triggering_actor, with: &GitHubOpenAPI.SimpleUser.changeset/2)
    |> cast_embed(:actor, with: &GitHubOpenAPI.SimpleUser.changeset/2)
    |> cast_embed(:head_repository, with: &GitHubOpenAPI.MinimalRepository.changeset/2)
  end
end
