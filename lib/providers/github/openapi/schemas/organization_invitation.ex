defmodule GitHubOpenAPI.OrganizationInvitation do
  @moduledoc """
  Provides struct and type for a OrganizationInvitation
  """
  use Apipe.Providers.OpenAPIEncoder

  @type t :: %__MODULE__{
          __info__: map,
          created_at: String.t(),
          email: String.t() | nil,
          failed_at: String.t() | nil,
          failed_reason: String.t() | nil,
          id: integer,
          invitation_source: String.t() | nil,
          invitation_teams_url: String.t(),
          inviter: GitHubOpenAPI.SimpleUser.t(),
          login: String.t() | nil,
          node_id: String.t(),
          role: String.t(),
          team_count: integer
        }

  defstruct [
    :__info__,
    :created_at,
    :email,
    :failed_at,
    :failed_reason,
    :id,
    :invitation_source,
    :invitation_teams_url,
    :inviter,
    :login,
    :node_id,
    :role,
    :team_count
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      created_at: {:string, :generic},
      email: {:union, [{:string, :generic}, :null]},
      failed_at: {:union, [{:string, :generic}, :null]},
      failed_reason: {:union, [{:string, :generic}, :null]},
      id: :integer,
      invitation_source: {:string, :generic},
      invitation_teams_url: {:string, :generic},
      inviter: {GitHubOpenAPI.SimpleUser, :t},
      login: {:union, [{:string, :generic}, :null]},
      node_id: {:string, :generic},
      role: {:string, :generic},
      team_count: :integer
    ]
  end
end
