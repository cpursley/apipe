defmodule GitHubOpenAPI.WorkflowRunUsageBillableWINDOWSJobRuns do
  @moduledoc """
  Provides struct and type for a WorkflowRunUsageBillableWINDOWSJobRuns
  """
  use Apipe.Providers.OpenAPIEncoder

  @type t :: %__MODULE__{__info__: map, __joins__: map, duration_ms: integer, job_id: integer}

  defstruct [:__info__, :__joins__, :duration_ms, :job_id]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [duration_ms: :integer, job_id: :integer]
  end
end
