defmodule GitHubOpenAPI.ProtectedBranchAllowForkSyncing do
  @moduledoc """
  Provides struct and type for a ProtectedBranchAllowForkSyncing
  """
  use Apipe.Providers.OpenAPIEncoder

  @type t :: %__MODULE__{__info__: map, enabled: boolean | nil}

  defstruct [:__info__, :enabled]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [enabled: :boolean]
  end
end
