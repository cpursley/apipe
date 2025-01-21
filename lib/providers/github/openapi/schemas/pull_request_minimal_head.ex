defmodule GitHubOpenAPI.PullRequestMinimalHead do
  @moduledoc """
  Provides struct and type for a PullRequestMinimalHead
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          ref: String.t(),
          repo: GitHubOpenAPI.PullRequestMinimalHeadRepo.t(),
          sha: String.t()
        }

  defstruct [:__info__, :__joins__, :ref, :repo, :sha]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      ref: {:string, :generic},
      repo: {GitHubOpenAPI.PullRequestMinimalHeadRepo, :t},
      sha: {:string, :generic}
    ]
  end
end
