defmodule GitHubOpenAPI.ContentTree do
  @moduledoc """
  Provides struct and type for a ContentTree
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          _links: GitHubOpenAPI.ContentTreeLinks.t(),
          content: String.t() | nil,
          download_url: String.t() | nil,
          entries: [GitHubOpenAPI.ContentTreeEntries.t()] | nil,
          git_url: String.t() | nil,
          html_url: String.t() | nil,
          name: String.t(),
          path: String.t(),
          sha: String.t(),
          size: integer,
          type: String.t(),
          url: String.t()
        }

  defstruct [
    :__info__,
    :__joins__,
    :_links,
    :content,
    :download_url,
    :entries,
    :git_url,
    :html_url,
    :name,
    :path,
    :sha,
    :size,
    :type,
    :url
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      _links: {GitHubOpenAPI.ContentTreeLinks, :t},
      content: {:string, :generic},
      download_url: {:string, :uri},
      entries: [{GitHubOpenAPI.ContentTreeEntries, :t}],
      git_url: {:string, :uri},
      html_url: {:string, :uri},
      name: {:string, :generic},
      path: {:string, :generic},
      sha: {:string, :generic},
      size: :integer,
      type: {:string, :generic},
      url: {:string, :uri}
    ]
  end
end
