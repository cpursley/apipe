defmodule GitHubOpenAPI.Job do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :check_run_url, :string
    field :completed_at, :string
    field :conclusion, Ecto.Enum, values: [:success, :failure, :neutral, :cancelled, :skipped, :timed_out, :action_required]
    field :created_at, :string
    field :head_branch, :string
    field :head_sha, :string
    field :html_url, :string
    field :id, :integer
    field :labels, {:array, :string}
    field :name, :string
    field :node_id, :string
    field :run_attempt, :integer
    field :run_id, :integer
    field :run_url, :string
    field :runner_group_id, :integer
    field :runner_group_name, :string
    field :runner_id, :integer
    field :runner_name, :string
    field :started_at, :string
    field :status, Ecto.Enum, values: [:queued, :in_progress, :completed, :waiting, :requested, :pending]
    field :steps, {:array, :string}
    field :url, :string
    field :workflow_name, :string
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:check_run_url, :completed_at, :conclusion, :created_at, :head_branch, :head_sha, :html_url, :id, :labels, :name, :node_id, :run_attempt, :run_id, :run_url, :runner_group_id, :runner_group_name, :runner_id, :runner_name, :started_at, :status, :steps, :url, :workflow_name, :__info__, :__joins__])
    
  end
end
