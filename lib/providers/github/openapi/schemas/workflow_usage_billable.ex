defmodule GitHubOpenAPI.WorkflowUsageBillable do
  @moduledoc """
  Provides struct and type for a WorkflowUsageBillable
  """
  use Apipe.Providers.OpenAPIEncoder

  @type t :: %__MODULE__{
          MACOS: GitHubOpenAPI.WorkflowUsageBillableMACOS.t() | nil,
          UBUNTU: GitHubOpenAPI.WorkflowUsageBillableUBUNTU.t() | nil,
          WINDOWS: GitHubOpenAPI.WorkflowUsageBillableWINDOWS.t() | nil,
          __info__: map,
          __joins__: map
        }

  defstruct [:MACOS, :UBUNTU, :WINDOWS, :__info__, :__joins__]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      MACOS: {GitHubOpenAPI.WorkflowUsageBillableMACOS, :t},
      UBUNTU: {GitHubOpenAPI.WorkflowUsageBillableUBUNTU, :t},
      WINDOWS: {GitHubOpenAPI.WorkflowUsageBillableWINDOWS, :t}
    ]
  end
end
