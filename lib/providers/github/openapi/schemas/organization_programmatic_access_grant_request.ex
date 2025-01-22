defmodule GitHubOpenAPI.OrganizationProgrammaticAccessGrantRequest do
  @moduledoc """
  Provides struct and type for a OrganizationProgrammaticAccessGrantRequest
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          created_at: String.t(),
          id: integer,
          owner: GitHubOpenAPI.SimpleUser.t(),
          permissions: GitHubOpenAPI.OrganizationProgrammaticAccessGrantRequestPermissions.t(),
          reason: String.t() | nil,
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
    :created_at,
    :id,
    :owner,
    :permissions,
    :reason,
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
      created_at: {:string, :generic},
      id: :integer,
      owner: {GitHubOpenAPI.SimpleUser, :t},
      permissions: {GitHubOpenAPI.OrganizationProgrammaticAccessGrantRequestPermissions, :t},
      reason: {:string, :generic},
      repositories_url: {:string, :generic},
      repository_selection: {:enum, ["none", "all", "subset"]},
      token_expired: :boolean,
      token_expires_at: {:string, :generic},
      token_id: :integer,
      token_last_used_at: {:string, :generic},
      token_name: {:string, :generic}
    ]
  end
end
