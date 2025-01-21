defmodule GitHubOpenAPI.GistSimple do
  @moduledoc """
  Provides struct and type for a GistSimple
  """
  use Apipe.Providers.OpenAPIEncoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          comments: integer | nil,
          comments_enabled: boolean | nil,
          comments_url: String.t() | nil,
          commits_url: String.t() | nil,
          created_at: String.t() | nil,
          description: String.t() | nil,
          files: GitHubOpenAPI.GistSimpleFiles.t() | nil,
          fork_of: GitHubOpenAPI.Gist.t() | nil,
          forks: [map] | nil,
          forks_url: String.t() | nil,
          git_pull_url: String.t() | nil,
          git_push_url: String.t() | nil,
          history: [map] | nil,
          html_url: String.t() | nil,
          id: String.t() | nil,
          node_id: String.t() | nil,
          owner: GitHubOpenAPI.SimpleUser.t() | nil,
          public: boolean | nil,
          truncated: boolean | nil,
          updated_at: String.t() | nil,
          url: String.t() | nil,
          user: String.t() | nil
        }

  defstruct [
    :__info__,
    :__joins__,
    :comments,
    :comments_enabled,
    :comments_url,
    :commits_url,
    :created_at,
    :description,
    :files,
    :fork_of,
    :forks,
    :forks_url,
    :git_pull_url,
    :git_push_url,
    :history,
    :html_url,
    :id,
    :node_id,
    :owner,
    :public,
    :truncated,
    :updated_at,
    :url,
    :user
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      comments: :integer,
      comments_enabled: :boolean,
      comments_url: {:string, :generic},
      commits_url: {:string, :generic},
      created_at: {:string, :generic},
      description: {:union, [{:string, :generic}, :null]},
      files: {GitHubOpenAPI.GistSimpleFiles, :t},
      fork_of: {:union, [{GitHubOpenAPI.Gist, :t}, :null]},
      forks: {:union, [[:map], :null]},
      forks_url: {:string, :generic},
      git_pull_url: {:string, :generic},
      git_push_url: {:string, :generic},
      history: {:union, [[:map], :null]},
      html_url: {:string, :generic},
      id: {:string, :generic},
      node_id: {:string, :generic},
      owner: {GitHubOpenAPI.SimpleUser, :t},
      public: :boolean,
      truncated: :boolean,
      updated_at: {:string, :generic},
      url: {:string, :generic},
      user: {:union, [{:string, :generic}, :null]}
    ]
  end
end
