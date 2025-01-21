defmodule GitHubOpenAPI.PageBuild do
  @moduledoc """
  Provides struct and type for a PageBuild
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          commit: String.t(),
          created_at: DateTime.t(),
          duration: integer,
          error: GitHubOpenAPI.PageBuildError.t(),
          pusher: GitHubOpenAPI.SimpleUser.t() | nil,
          status: String.t(),
          updated_at: DateTime.t(),
          url: String.t()
        }

  defstruct [
    :__info__,
    :__joins__,
    :commit,
    :created_at,
    :duration,
    :error,
    :pusher,
    :status,
    :updated_at,
    :url
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      commit: {:string, :generic},
      created_at: {:string, :date_time},
      duration: :integer,
      error: {GitHubOpenAPI.PageBuildError, :t},
      pusher: {:union, [{GitHubOpenAPI.SimpleUser, :t}, :null]},
      status: {:string, :generic},
      updated_at: {:string, :date_time},
      url: {:string, :uri}
    ]
  end
end
