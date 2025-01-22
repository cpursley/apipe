defmodule GitHubOpenAPI.GistHistory do
  @moduledoc """
  Provides struct and type for a GistHistory
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          change_status: GitHubOpenAPI.GistHistoryChangeStatus.t() | nil,
          committed_at: DateTime.t() | nil,
          url: String.t() | nil,
          user: GitHubOpenAPI.NullableSimpleUser.t() | nil,
          version: String.t() | nil
        }

  defstruct [:__info__, :__joins__, :change_status, :committed_at, :url, :user, :version]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      change_status: {GitHubOpenAPI.GistHistoryChangeStatus, :t},
      committed_at: {:string, :date_time},
      url: {:string, :uri},
      user: {GitHubOpenAPI.NullableSimpleUser, :t},
      version: {:string, :generic}
    ]
  end
end
