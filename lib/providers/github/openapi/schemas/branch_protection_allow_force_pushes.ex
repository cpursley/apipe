defmodule GitHubOpenAPI.BranchProtectionAllowForcePushes do
  @moduledoc """
  Provides struct and type for a BranchProtectionAllowForcePushes
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{__info__: map, __joins__: map, enabled: boolean | nil}

  defstruct [:__info__, :__joins__, :enabled]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [enabled: :boolean]
  end
end
