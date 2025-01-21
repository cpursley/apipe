defmodule GitHubOpenAPI.BranchProtectionRequiredSignatures do
  @moduledoc """
  Provides struct and type for a BranchProtectionRequiredSignatures
  """
  use Apipe.Providers.OpenAPIEncoder

  @type t :: %__MODULE__{__info__: map, __joins__: map, enabled: boolean, url: String.t()}

  defstruct [:__info__, :__joins__, :enabled, :url]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [enabled: :boolean, url: {:string, :uri}]
  end
end
