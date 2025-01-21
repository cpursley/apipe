defmodule GitHubOpenAPI.PullRequestSimpleHead do
  @moduledoc """
  Provides struct and type for a PullRequestSimpleHead
  """
  use Apipe.Providers.OpenAPIEncoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          label: String.t(),
          ref: String.t(),
          repo: GitHubOpenAPI.Repository.t(),
          sha: String.t(),
          user: GitHubOpenAPI.SimpleUser.t() | nil
        }

  defstruct [:__info__, :__joins__, :label, :ref, :repo, :sha, :user]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      label: {:string, :generic},
      ref: {:string, :generic},
      repo: {GitHubOpenAPI.Repository, :t},
      sha: {:string, :generic},
      user: {:union, [{GitHubOpenAPI.SimpleUser, :t}, :null]}
    ]
  end
end
