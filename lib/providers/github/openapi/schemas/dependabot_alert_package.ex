defmodule GitHubOpenAPI.DependabotAlertPackage do
  @moduledoc """
  Provides struct and type for a DependabotAlertPackage
  """
  use Apipe.Providers.OpenAPIEncoder

  @type t :: %__MODULE__{__info__: map, __joins__: map, ecosystem: String.t(), name: String.t()}

  defstruct [:__info__, :__joins__, :ecosystem, :name]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [ecosystem: {:string, :generic}, name: {:string, :generic}]
  end
end
