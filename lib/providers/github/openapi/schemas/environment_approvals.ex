defmodule GitHubOpenAPI.EnvironmentApprovals do
  @moduledoc """
  Provides struct and type for a EnvironmentApprovals
  """
  use Apipe.Providers.OpenAPIEncoder

  @type t :: %__MODULE__{
          __info__: map,
          comment: String.t(),
          environments: [GitHubOpenAPI.EnvironmentApprovalsEnvironments.t()],
          state: String.t(),
          user: GitHubOpenAPI.SimpleUser.t()
        }

  defstruct [:__info__, :comment, :environments, :state, :user]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      comment: {:string, :generic},
      environments: [{GitHubOpenAPI.EnvironmentApprovalsEnvironments, :t}],
      state: {:enum, ["approved", "rejected", "pending"]},
      user: {GitHubOpenAPI.SimpleUser, :t}
    ]
  end
end
