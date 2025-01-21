defmodule GitHubOpenAPI.GistCommit do
  @moduledoc """
  Provides struct and type for a GistCommit
  """
  use Apipe.Providers.OpenAPIEncoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          change_status: GitHubOpenAPI.GistCommitChangeStatus.t(),
          committed_at: DateTime.t(),
          url: String.t(),
          user: GitHubOpenAPI.SimpleUser.t() | nil,
          version: String.t()
        }

  defstruct [:__info__, :__joins__, :change_status, :committed_at, :url, :user, :version]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      change_status: {GitHubOpenAPI.GistCommitChangeStatus, :t},
      committed_at: {:string, :date_time},
      url: {:string, :uri},
      user: {:union, [{GitHubOpenAPI.SimpleUser, :t}, :null]},
      version: {:string, :generic}
    ]
  end
end
