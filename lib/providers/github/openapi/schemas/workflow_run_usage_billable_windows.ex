defmodule GitHubOpenAPI.WorkflowRunUsageBillableWINDOWS do
  @moduledoc """
  Provides struct and type for a WorkflowRunUsageBillableWINDOWS
  """
  use Apipe.Providers.OpenAPIEncoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          job_runs: [GitHubOpenAPI.WorkflowRunUsageBillableWINDOWSJobRuns.t()] | nil,
          jobs: integer,
          total_ms: integer
        }

  defstruct [:__info__, :__joins__, :job_runs, :jobs, :total_ms]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      job_runs: [{GitHubOpenAPI.WorkflowRunUsageBillableWINDOWSJobRuns, :t}],
      jobs: :integer,
      total_ms: :integer
    ]
  end
end
