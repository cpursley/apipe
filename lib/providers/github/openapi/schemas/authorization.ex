defmodule GitHubOpenAPI.Authorization do
  @moduledoc """
  Provides struct and type for a Authorization
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          app: GitHubOpenAPI.AuthorizationApp.t(),
          created_at: DateTime.t(),
          expires_at: DateTime.t() | nil,
          fingerprint: String.t() | nil,
          hashed_token: String.t() | nil,
          id: integer,
          installation: GitHubOpenAPI.ScopedInstallation.t() | nil,
          note: String.t() | nil,
          note_url: String.t() | nil,
          scopes: [String.t()] | nil,
          token: String.t(),
          token_last_eight: String.t() | nil,
          updated_at: DateTime.t(),
          url: String.t(),
          user: GitHubOpenAPI.SimpleUser.t() | nil
        }

  defstruct [
    :__info__,
    :__joins__,
    :app,
    :created_at,
    :expires_at,
    :fingerprint,
    :hashed_token,
    :id,
    :installation,
    :note,
    :note_url,
    :scopes,
    :token,
    :token_last_eight,
    :updated_at,
    :url,
    :user
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      app: {GitHubOpenAPI.AuthorizationApp, :t},
      created_at: {:string, :date_time},
      expires_at: {:union, [{:string, :date_time}, :null]},
      fingerprint: {:union, [{:string, :generic}, :null]},
      hashed_token: {:union, [{:string, :generic}, :null]},
      id: :integer,
      installation: {:union, [{GitHubOpenAPI.ScopedInstallation, :t}, :null]},
      note: {:union, [{:string, :generic}, :null]},
      note_url: {:union, [{:string, :uri}, :null]},
      scopes: {:union, [[string: :generic], :null]},
      token: {:string, :generic},
      token_last_eight: {:union, [{:string, :generic}, :null]},
      updated_at: {:string, :date_time},
      url: {:string, :uri},
      user: {:union, [{GitHubOpenAPI.SimpleUser, :t}, :null]}
    ]
  end
end
