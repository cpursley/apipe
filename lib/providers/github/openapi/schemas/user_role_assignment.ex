defmodule GitHubOpenAPI.UserRoleAssignment do
  @moduledoc """
  Provides struct and type for a UserRoleAssignment
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          assignment: String.t() | nil,
          avatar_url: String.t(),
          email: String.t() | nil,
          events_url: String.t(),
          followers_url: String.t(),
          following_url: String.t(),
          gists_url: String.t(),
          gravatar_id: String.t() | nil,
          html_url: String.t(),
          id: integer,
          inherited_from: [GitHubOpenAPI.TeamSimple.t()] | nil,
          login: String.t(),
          name: String.t() | nil,
          node_id: String.t(),
          organizations_url: String.t(),
          received_events_url: String.t(),
          repos_url: String.t(),
          site_admin: boolean,
          starred_at: String.t() | nil,
          starred_url: String.t(),
          subscriptions_url: String.t(),
          type: String.t(),
          url: String.t(),
          user_view_type: String.t() | nil
        }

  defstruct [
    :__info__,
    :__joins__,
    :assignment,
    :avatar_url,
    :email,
    :events_url,
    :followers_url,
    :following_url,
    :gists_url,
    :gravatar_id,
    :html_url,
    :id,
    :inherited_from,
    :login,
    :name,
    :node_id,
    :organizations_url,
    :received_events_url,
    :repos_url,
    :site_admin,
    :starred_at,
    :starred_url,
    :subscriptions_url,
    :type,
    :url,
    :user_view_type
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      assignment: {:enum, ["direct", "indirect", "mixed"]},
      avatar_url: {:string, :uri},
      email: {:union, [{:string, :generic}, :null]},
      events_url: {:string, :generic},
      followers_url: {:string, :uri},
      following_url: {:string, :generic},
      gists_url: {:string, :generic},
      gravatar_id: {:union, [{:string, :generic}, :null]},
      html_url: {:string, :uri},
      id: :integer,
      inherited_from: [{GitHubOpenAPI.TeamSimple, :t}],
      login: {:string, :generic},
      name: {:union, [{:string, :generic}, :null]},
      node_id: {:string, :generic},
      organizations_url: {:string, :uri},
      received_events_url: {:string, :uri},
      repos_url: {:string, :uri},
      site_admin: :boolean,
      starred_at: {:string, :generic},
      starred_url: {:string, :generic},
      subscriptions_url: {:string, :uri},
      type: {:string, :generic},
      url: {:string, :uri},
      user_view_type: {:string, :generic}
    ]
  end
end
