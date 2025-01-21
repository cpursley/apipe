defmodule GitHubOpenAPI.RepositoryRulesetBypassActor do
  @moduledoc """
  Provides struct and type for a RepositoryRulesetBypassActor
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          actor_id: integer | nil,
          actor_type: String.t(),
          bypass_mode: String.t() | nil
        }

  defstruct [:__info__, :__joins__, :actor_id, :actor_type, :bypass_mode]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      actor_id: {:union, [:integer, :null]},
      actor_type:
        {:enum, ["Integration", "OrganizationAdmin", "RepositoryRole", "Team", "DeployKey"]},
      bypass_mode: {:enum, ["always", "pull_request"]}
    ]
  end
end
