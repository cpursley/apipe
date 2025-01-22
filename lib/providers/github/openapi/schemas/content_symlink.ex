defmodule GitHubOpenAPI.ContentSymlink do
  @moduledoc """
  Provides struct and type for a ContentSymlink
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          _links: GitHubOpenAPI.ContentSymlinkLinks.t(),
          download_url: String.t() | nil,
          git_url: String.t() | nil,
          html_url: String.t() | nil,
          name: String.t(),
          path: String.t(),
          sha: String.t(),
          size: integer,
          target: String.t(),
          type: String.t(),
          url: String.t()
        }

  defstruct [
    :__info__,
    :__joins__,
    :_links,
    :download_url,
    :git_url,
    :html_url,
    :name,
    :path,
    :sha,
    :size,
    :target,
    :type,
    :url
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      _links: {GitHubOpenAPI.ContentSymlinkLinks, :t},
      download_url: {:string, :uri},
      git_url: {:string, :uri},
      html_url: {:string, :uri},
      name: {:string, :generic},
      path: {:string, :generic},
      sha: {:string, :generic},
      size: :integer,
      target: {:string, :generic},
      type: {:const, "symlink"},
      url: {:string, :uri}
    ]
  end
end
