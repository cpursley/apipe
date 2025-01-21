defmodule GitHubOpenAPI.CommitComparison do
  @moduledoc """
  Provides struct and type for a CommitComparison
  """
  use Apipe.Providers.OpenAPIEncoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          ahead_by: integer,
          base_commit: GitHubOpenAPI.Commit.t(),
          behind_by: integer,
          commits: [GitHubOpenAPI.Commit.t()],
          diff_url: String.t(),
          files: [GitHubOpenAPI.DiffEntry.t()] | nil,
          html_url: String.t(),
          merge_base_commit: GitHubOpenAPI.Commit.t(),
          patch_url: String.t(),
          permalink_url: String.t(),
          status: String.t(),
          total_commits: integer,
          url: String.t()
        }

  defstruct [
    :__info__,
    :__joins__,
    :ahead_by,
    :base_commit,
    :behind_by,
    :commits,
    :diff_url,
    :files,
    :html_url,
    :merge_base_commit,
    :patch_url,
    :permalink_url,
    :status,
    :total_commits,
    :url
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      ahead_by: :integer,
      base_commit: {GitHubOpenAPI.Commit, :t},
      behind_by: :integer,
      commits: [{GitHubOpenAPI.Commit, :t}],
      diff_url: {:string, :uri},
      files: [{GitHubOpenAPI.DiffEntry, :t}],
      html_url: {:string, :uri},
      merge_base_commit: {GitHubOpenAPI.Commit, :t},
      patch_url: {:string, :uri},
      permalink_url: {:string, :uri},
      status: {:enum, ["diverged", "ahead", "behind", "identical"]},
      total_commits: :integer,
      url: {:string, :uri}
    ]
  end
end
