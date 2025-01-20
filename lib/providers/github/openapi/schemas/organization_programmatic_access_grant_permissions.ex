defmodule GitHubOpenAPI.OrganizationProgrammaticAccessGrantPermissions do
  @moduledoc """
  Provides struct and type for a OrganizationProgrammaticAccessGrantPermissions
  """
  use Apipe.Providers.OpenAPIEncoder

  @type t :: %__MODULE__{
          __info__: map,
          organization:
            GitHubOpenAPI.OrganizationProgrammaticAccessGrantPermissionsOrganization.t() | nil,
          other: GitHubOpenAPI.OrganizationProgrammaticAccessGrantPermissionsOther.t() | nil,
          repository:
            GitHubOpenAPI.OrganizationProgrammaticAccessGrantPermissionsRepository.t() | nil
        }

  defstruct [:__info__, :organization, :other, :repository]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      organization:
        {GitHubOpenAPI.OrganizationProgrammaticAccessGrantPermissionsOrganization, :t},
      other: {GitHubOpenAPI.OrganizationProgrammaticAccessGrantPermissionsOther, :t},
      repository: {GitHubOpenAPI.OrganizationProgrammaticAccessGrantPermissionsRepository, :t}
    ]
  end
end
