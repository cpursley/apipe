defmodule GitHubOpenAPI.SimpleCheckSuite do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :after, :string
    field :before, :string
    field :conclusion, Ecto.Enum, values: [:success, :failure, :neutral, :cancelled, :skipped, :timed_out, :action_required, :stale, :startup_failure]
    field :created_at, :string
    field :head_branch, :string
    field :head_sha, :string
    field :id, :integer
    field :node_id, :string
    field :status, Ecto.Enum, values: [:queued, :in_progress, :completed, :pending, :waiting]
    field :updated_at, :string
    field :url, :string
    embeds_one :app, GitHubOpenAPI.Integration
    embeds_many :pull_requests, GitHubOpenAPI.PullRequestMinimal
    embeds_one :repository, GitHubOpenAPI.MinimalRepository
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:after, :before, :conclusion, :created_at, :head_branch, :head_sha, :id, :node_id, :status, :updated_at, :url, :__info__, :__joins__])
        |> cast_embed(:app, with: &GitHubOpenAPI.Integration.changeset/2)
    |> cast_embed(:pull_requests, with: &GitHubOpenAPI.PullRequestMinimal.changeset/2)
    |> cast_embed(:repository, with: &GitHubOpenAPI.MinimalRepository.changeset/2)
  end
end
