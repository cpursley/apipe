defmodule GitHubOpenAPI.DeploymentBranchPolicy do
  @moduledoc """
  Provides struct and type for a DeploymentBranchPolicy
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          id: integer | nil,
          name: String.t() | nil,
          node_id: String.t() | nil,
          type: String.t() | nil
        }

  defstruct [:__info__, :__joins__, :id, :name, :node_id, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      id: :integer,
      name: {:string, :generic},
      node_id: {:string, :generic},
      type: {:enum, ["branch", "tag"]}
    ]
  end
end
