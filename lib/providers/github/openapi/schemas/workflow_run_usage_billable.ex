defmodule GitHubOpenAPI.WorkflowRunUsageBillable do
  @moduledoc """
  Provides struct and type for a WorkflowRunUsageBillable
  """
  use Apipe.Providers.OpenAPIEncoder

  @type t :: %__MODULE__{
          MACOS: GitHubOpenAPI.WorkflowRunUsageBillableMACOS.t() | nil,
          UBUNTU: GitHubOpenAPI.WorkflowRunUsageBillableUBUNTU.t() | nil,
          WINDOWS: GitHubOpenAPI.WorkflowRunUsageBillableWINDOWS.t() | nil,
          __info__: map,
          __joins__: map
        }

  defstruct [:MACOS, :UBUNTU, :WINDOWS, :__info__, :__joins__]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      MACOS: {GitHubOpenAPI.WorkflowRunUsageBillableMACOS, :t},
      UBUNTU: {GitHubOpenAPI.WorkflowRunUsageBillableUBUNTU, :t},
      WINDOWS: {GitHubOpenAPI.WorkflowRunUsageBillableWINDOWS, :t}
    ]
  end
end
