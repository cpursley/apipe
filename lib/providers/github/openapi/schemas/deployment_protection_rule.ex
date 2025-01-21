defmodule GitHubOpenAPI.DeploymentProtectionRule do
  @moduledoc """
  Provides struct and type for a DeploymentProtectionRule
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          app: GitHubOpenAPI.CustomDeploymentRuleApp.t(),
          enabled: boolean,
          id: integer,
          node_id: String.t()
        }

  defstruct [:__info__, :__joins__, :app, :enabled, :id, :node_id]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      app: {GitHubOpenAPI.CustomDeploymentRuleApp, :t},
      enabled: :boolean,
      id: :integer,
      node_id: {:string, :generic}
    ]
  end
end
