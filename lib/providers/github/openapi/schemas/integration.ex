defmodule GitHubOpenAPI.Integration do
  @moduledoc """
  Provides struct and type for a Integration
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          client_id: String.t() | nil,
          client_secret: String.t() | nil,
          created_at: DateTime.t(),
          description: String.t() | nil,
          events: [String.t()],
          external_url: String.t(),
          html_url: String.t(),
          id: integer,
          installations_count: integer | nil,
          name: String.t(),
          node_id: String.t(),
          owner: GitHubOpenAPI.Enterprise.t() | GitHubOpenAPI.SimpleUser.t(),
          pem: String.t() | nil,
          permissions: map,
          slug: String.t() | nil,
          updated_at: DateTime.t(),
          webhook_secret: String.t() | nil
        }

  defstruct [
    :__info__,
    :__joins__,
    :client_id,
    :client_secret,
    :created_at,
    :description,
    :events,
    :external_url,
    :html_url,
    :id,
    :installations_count,
    :name,
    :node_id,
    :owner,
    :pem,
    :permissions,
    :slug,
    :updated_at,
    :webhook_secret
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      client_id: {:string, :generic},
      client_secret: {:string, :generic},
      created_at: {:string, :date_time},
      description: {:string, :generic},
      events: [string: :generic],
      external_url: {:string, :uri},
      html_url: {:string, :uri},
      id: :integer,
      installations_count: :integer,
      name: {:string, :generic},
      node_id: {:string, :generic},
      owner: {:union, [{GitHubOpenAPI.Enterprise, :t}, {GitHubOpenAPI.SimpleUser, :t}]},
      pem: {:string, :generic},
      permissions: :map,
      slug: {:string, :generic},
      updated_at: {:string, :date_time},
      webhook_secret: {:string, :generic}
    ]
  end
end
