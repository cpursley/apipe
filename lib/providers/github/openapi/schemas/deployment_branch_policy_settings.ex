defmodule GitHubOpenAPI.DeploymentBranchPolicySettings do
  @moduledoc """
  Provides struct and type for a DeploymentBranchPolicySettings
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          custom_branch_policies: boolean,
          protected_branches: boolean
        }

  defstruct [:__info__, :__joins__, :custom_branch_policies, :protected_branches]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [custom_branch_policies: :boolean, protected_branches: :boolean]
  end
end
