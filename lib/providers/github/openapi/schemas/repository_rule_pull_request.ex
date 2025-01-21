defmodule GitHubOpenAPI.RepositoryRulePullRequest do
  @moduledoc """
  Provides struct and type for a RepositoryRulePullRequest
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{__info__: map, __joins__: map, parameters: map | nil, type: String.t()}

  defstruct [:__info__, :__joins__, :parameters, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [parameters: :map, type: {:const, "pull_request"}]
  end
end
