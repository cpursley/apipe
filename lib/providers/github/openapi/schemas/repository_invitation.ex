defmodule GitHubOpenAPI.RepositoryInvitation do
  @moduledoc """
  Provides struct and type for a RepositoryInvitation
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          created_at: DateTime.t(),
          expired: boolean | nil,
          html_url: String.t(),
          id: integer,
          invitee: GitHubOpenAPI.NullableSimpleUser.t(),
          inviter: GitHubOpenAPI.NullableSimpleUser.t(),
          node_id: String.t(),
          permissions: String.t(),
          repository: GitHubOpenAPI.MinimalRepository.t(),
          url: String.t()
        }

  defstruct [
    :__info__,
    :__joins__,
    :created_at,
    :expired,
    :html_url,
    :id,
    :invitee,
    :inviter,
    :node_id,
    :permissions,
    :repository,
    :url
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      created_at: {:string, :date_time},
      expired: :boolean,
      html_url: {:string, :generic},
      id: :integer,
      invitee: {GitHubOpenAPI.NullableSimpleUser, :t},
      inviter: {GitHubOpenAPI.NullableSimpleUser, :t},
      node_id: {:string, :generic},
      permissions: {:enum, ["read", "write", "admin", "triage", "maintain"]},
      repository: {GitHubOpenAPI.MinimalRepository, :t},
      url: {:string, :generic}
    ]
  end
end
