defmodule GitHubOpenAPI.CommitSearchResultItem do
  @moduledoc """
  Provides struct and type for a CommitSearchResultItem
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          author: GitHubOpenAPI.NullableSimpleUser.t(),
          comments_url: String.t(),
          commit: GitHubOpenAPI.CommitSearchResultItemCommit.t(),
          committer: GitHubOpenAPI.NullableGitUser.t(),
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
    :__joins__,
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
      author: {GitHubOpenAPI.NullableSimpleUser, :t},
      comments_url: {:string, :uri},
      commit: {GitHubOpenAPI.CommitSearchResultItemCommit, :t},
      committer: {GitHubOpenAPI.NullableGitUser, :t},
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
