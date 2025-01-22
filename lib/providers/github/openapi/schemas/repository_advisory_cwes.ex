defmodule GitHubOpenAPI.RepositoryAdvisoryCwes do
  @moduledoc """
  Provides struct and type for a RepositoryAdvisoryCwes
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{__info__: map, __joins__: map, cwe_id: String.t(), name: String.t()}

  defstruct [:__info__, :__joins__, :cwe_id, :name]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [cwe_id: {:string, :generic}, name: {:string, :generic}]
  end
end
