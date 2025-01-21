defmodule GitHubOpenAPI.RepositoryRuleCommitMessagePattern do
  @moduledoc """
  Provides struct and type for a RepositoryRuleCommitMessagePattern
  """
  use Apipe.Providers.OpenAPIEncoder

  @type t :: %__MODULE__{__info__: map, __joins__: map, parameters: map | nil, type: String.t()}

  defstruct [:__info__, :__joins__, :parameters, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [parameters: :map, type: {:const, "commit_message_pattern"}]
  end
end
