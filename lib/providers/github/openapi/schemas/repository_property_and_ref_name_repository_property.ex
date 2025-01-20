defmodule GitHubOpenAPI.RepositoryPropertyAndRefNameRepositoryProperty do
  @moduledoc """
  Provides struct and type for a RepositoryPropertyAndRefNameRepositoryProperty
  """
  use Apipe.Providers.OpenAPIEncoder

  @type t :: %__MODULE__{
          __info__: map,
          exclude: [GitHubOpenAPI.RepositoryRulesetConditionsRepositoryPropertySpec.t()] | nil,
          include: [GitHubOpenAPI.RepositoryRulesetConditionsRepositoryPropertySpec.t()] | nil
        }

  defstruct [:__info__, :exclude, :include]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      exclude: [{GitHubOpenAPI.RepositoryRulesetConditionsRepositoryPropertySpec, :t}],
      include: [{GitHubOpenAPI.RepositoryRulesetConditionsRepositoryPropertySpec, :t}]
    ]
  end
end
