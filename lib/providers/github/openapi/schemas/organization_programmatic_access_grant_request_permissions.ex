defmodule GitHubOpenAPI.OrganizationProgrammaticAccessGrantRequestPermissions do
  @moduledoc """
  Provides struct and type for a OrganizationProgrammaticAccessGrantRequestPermissions
  """
  use Apipe.Providers.OpenAPIEncoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          organization:
            GitHubOpenAPI.OrganizationProgrammaticAccessGrantRequestPermissionsOrganization.t()
            | nil,
          other:
            GitHubOpenAPI.OrganizationProgrammaticAccessGrantRequestPermissionsOther.t() | nil,
          repository:
            GitHubOpenAPI.OrganizationProgrammaticAccessGrantRequestPermissionsRepository.t()
            | nil
        }

  defstruct [:__info__, :__joins__, :organization, :other, :repository]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      organization:
        {GitHubOpenAPI.OrganizationProgrammaticAccessGrantRequestPermissionsOrganization, :t},
      other: {GitHubOpenAPI.OrganizationProgrammaticAccessGrantRequestPermissionsOther, :t},
      repository:
        {GitHubOpenAPI.OrganizationProgrammaticAccessGrantRequestPermissionsRepository, :t}
    ]
  end
end
