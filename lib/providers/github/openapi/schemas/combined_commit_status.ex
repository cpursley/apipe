defmodule GitHubOpenAPI.CombinedCommitStatus do
  @moduledoc """
  Provides struct and type for a CombinedCommitStatus
  """
  use Apipe.Providers.OpenAPIEncoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          commit_url: String.t(),
          repository: GitHubOpenAPI.MinimalRepository.t(),
          sha: String.t(),
          state: String.t(),
          statuses: [GitHubOpenAPI.SimpleCommitStatus.t()],
          total_count: integer,
          url: String.t()
        }

  defstruct [
    :__info__,
    :__joins__,
    :commit_url,
    :repository,
    :sha,
    :state,
    :statuses,
    :total_count,
    :url
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      commit_url: {:string, :uri},
      repository: {GitHubOpenAPI.MinimalRepository, :t},
      sha: {:string, :generic},
      state: {:string, :generic},
      statuses: [{GitHubOpenAPI.SimpleCommitStatus, :t}],
      total_count: :integer,
      url: {:string, :uri}
    ]
  end
end
