defmodule GitHubOpenAPI.RepositoryRuleRequiredSignatures do
  @moduledoc """
  Provides struct and type for a RepositoryRuleRequiredSignatures
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{__info__: map, __joins__: map, type: String.t()}

  defstruct [:__info__, :__joins__, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [type: {:const, "required_signatures"}]
  end
end
