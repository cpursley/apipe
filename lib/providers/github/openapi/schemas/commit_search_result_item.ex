defmodule GitHubOpenAPI.CommitSearchResultItem do
  @moduledoc """
  Provides struct and type for a CommitSearchResultItem
  """
  use Apipe.Providers.OpenAPIEncoder

  @type t :: %__MODULE__{
          __info__: map,
          author: GitHubOpenAPI.SimpleUser.t() | nil,
          comments_url: String.t(),
          commit: GitHubOpenAPI.CommitSearchResultItemCommit.t(),
          committer: GitHubOpenAPI.GitUser.t() | nil,
          html_url: String.t(),
          node_id: String.t(),
          parents: [GitHubOpenAPI.CommitSearchResultItemParents.t()],
          repository: GitHubOpenAPI.MinimalRepository.t(),
          score: number,
          sha: String.t(),
          text_matches: [GitHubOpenAPI.SearchResultTextMatches.t()] | nil,
          url: String.t()
        }

  defstruct [
    :__info__,
    :author,
    :comments_url,
    :commit,
    :committer,
    :html_url,
    :node_id,
    :parents,
    :repository,
    :score,
    :sha,
    :text_matches,
    :url
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      author: {:union, [{GitHubOpenAPI.SimpleUser, :t}, :null]},
      comments_url: {:string, :uri},
      commit: {GitHubOpenAPI.CommitSearchResultItemCommit, :t},
      committer: {:union, [{GitHubOpenAPI.GitUser, :t}, :null]},
      html_url: {:string, :uri},
      node_id: {:string, :generic},
      parents: [{GitHubOpenAPI.CommitSearchResultItemParents, :t}],
      repository: {GitHubOpenAPI.MinimalRepository, :t},
      score: :number,
      sha: {:string, :generic},
      text_matches: [{GitHubOpenAPI.SearchResultTextMatches, :t}],
      url: {:string, :uri}
    ]
  end
end
