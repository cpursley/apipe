defmodule GitHubOpenAPI.WorkflowUsage do
  @moduledoc """
  Provides struct and type for a WorkflowUsage
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          billable: GitHubOpenAPI.WorkflowUsageBillable.t()
        }

  defstruct [:__info__, :__joins__, :billable]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [billable: {GitHubOpenAPI.WorkflowUsageBillable, :t}]
  end
end
