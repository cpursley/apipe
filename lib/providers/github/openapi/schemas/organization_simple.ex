defmodule GitHubOpenAPI.OrganizationSimple do
  @moduledoc """
  Provides struct and type for a OrganizationSimple
  """
  use Apipe.Providers.OpenAPIEncoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          avatar_url: String.t(),
          description: String.t() | nil,
          events_url: String.t(),
          hooks_url: String.t(),
          id: integer,
          issues_url: String.t(),
          login: String.t(),
          members_url: String.t(),
          node_id: String.t(),
          public_members_url: String.t(),
          repos_url: String.t(),
          url: String.t()
        }

  defstruct [
    :__info__,
    :__joins__,
    :avatar_url,
    :description,
    :events_url,
    :hooks_url,
    :id,
    :issues_url,
    :login,
    :members_url,
    :node_id,
    :public_members_url,
    :repos_url,
    :url
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      avatar_url: {:string, :generic},
      description: {:union, [{:string, :generic}, :null]},
      events_url: {:string, :uri},
      hooks_url: {:string, :generic},
      id: :integer,
      issues_url: {:string, :generic},
      login: {:string, :generic},
      members_url: {:string, :generic},
      node_id: {:string, :generic},
      public_members_url: {:string, :generic},
      repos_url: {:string, :uri},
      url: {:string, :uri}
    ]
  end
end
