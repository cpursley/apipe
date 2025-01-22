defmodule GitHubOpenAPI.AuthenticationToken do
  @moduledoc """
  Provides struct and type for a AuthenticationToken
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          expires_at: DateTime.t(),
          permissions: map | nil,
          repositories: [GitHubOpenAPI.Repository.t()] | nil,
          repository_selection: String.t() | nil,
          single_file: String.t() | nil,
          token: String.t()
        }

  defstruct [
    :__info__,
    :__joins__,
    :expires_at,
    :permissions,
    :repositories,
    :repository_selection,
    :single_file,
    :token
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      expires_at: {:string, :date_time},
      permissions: :map,
      repositories: [{GitHubOpenAPI.Repository, :t}],
      repository_selection: {:enum, ["all", "selected"]},
      single_file: {:string, :generic},
      token: {:string, :generic}
    ]
  end
end
