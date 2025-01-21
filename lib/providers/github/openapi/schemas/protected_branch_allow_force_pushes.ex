defmodule GitHubOpenAPI.ProtectedBranchAllowForcePushes do
  @moduledoc """
  Provides struct and type for a ProtectedBranchAllowForcePushes
  """
  use Apipe.Providers.OpenAPIEncoder

  @type t :: %__MODULE__{__info__: map, __joins__: map, enabled: boolean}

  defstruct [:__info__, :__joins__, :enabled]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [enabled: :boolean]
  end
end
