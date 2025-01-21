defmodule GitHubOpenAPI.RepositoryRulesetConditions do
  @moduledoc """
  Provides struct and type for a RepositoryRulesetConditions
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{__info__: map, __joins__: map, ref_name: map | nil}

  defstruct [:__info__, :__joins__, :ref_name]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [ref_name: :map]
  end
end
