defmodule GitHubOpenAPI.CodeSecurityConfigurationDependencyGraphAutosubmitActionOptions do
  @moduledoc """
  Provides struct and type for a CodeSecurityConfigurationDependencyGraphAutosubmitActionOptions
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{__info__: map, __joins__: map, labeled_runners: boolean | nil}

  defstruct [:__info__, :__joins__, :labeled_runners]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [labeled_runners: :boolean]
  end
end
