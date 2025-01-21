defmodule GitHubOpenAPI.OrgMembershipPermissions do
  @moduledoc """
  Provides struct and type for a OrgMembershipPermissions
  """
  use Apipe.Providers.OpenAPIEncoder

  @type t :: %__MODULE__{__info__: map, __joins__: map, can_create_repository: boolean}

  defstruct [:__info__, :__joins__, :can_create_repository]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [can_create_repository: :boolean]
  end
end
