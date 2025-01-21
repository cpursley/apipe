defmodule GitHubOpenAPI.OrganizationProgrammaticAccessGrant do
  @moduledoc """
  Provides struct and type for a OrganizationProgrammaticAccessGrant
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          access_granted_at: String.t(),
          id: integer,
          owner: GitHubOpenAPI.SimpleUser.t(),
          permissions: GitHubOpenAPI.OrganizationProgrammaticAccessGrantPermissions.t(),
          repositories_url: String.t(),
          repository_selection: String.t(),
          token_expired: boolean,
          token_expires_at: String.t() | nil,
          token_id: integer,
          token_last_used_at: String.t() | nil,
          token_name: String.t()
        }

  defstruct [
    :__info__,
    :__joins__,
    :access_granted_at,
    :id,
    :owner,
    :permissions,
    :repositories_url,
    :repository_selection,
    :token_expired,
    :token_expires_at,
    :token_id,
    :token_last_used_at,
    :token_name
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      access_granted_at: {:string, :generic},
      id: :integer,
      owner: {GitHubOpenAPI.SimpleUser, :t},
      permissions: {GitHubOpenAPI.OrganizationProgrammaticAccessGrantPermissions, :t},
      repositories_url: {:string, :generic},
      repository_selection: {:enum, ["none", "all", "subset"]},
      token_expired: :boolean,
      token_expires_at: {:union, [{:string, :generic}, :null]},
      token_id: :integer,
      token_last_used_at: {:union, [{:string, :generic}, :null]},
      token_name: {:string, :generic}
    ]
  end
end
