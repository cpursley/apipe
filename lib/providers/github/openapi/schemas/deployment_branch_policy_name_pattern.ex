defmodule GitHubOpenAPI.DeploymentBranchPolicyNamePattern do
  @moduledoc """
  Provides struct and type for a DeploymentBranchPolicyNamePattern
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{__info__: map, __joins__: map, name: String.t()}

  defstruct [:__info__, :__joins__, :name]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [name: {:string, :generic}]
  end
end
