defmodule GitHubOpenAPI.LicenseContent do
  @moduledoc """
  Provides struct and type for a LicenseContent
  """
  use Apipe.Providers.OpenAPIEncoder

  @type t :: %__MODULE__{
          __info__: map,
          _links: GitHubOpenAPI.LicenseContentLinks.t(),
          content: String.t(),
          download_url: String.t() | nil,
          encoding: String.t(),
          git_url: String.t() | nil,
          html_url: String.t() | nil,
          license: GitHubOpenAPI.LicenseSimple.t() | nil,
          name: String.t(),
          path: String.t(),
          sha: String.t(),
          size: integer,
          type: String.t(),
          url: String.t()
        }

  defstruct [
    :__info__,
    :_links,
    :content,
    :download_url,
    :encoding,
    :git_url,
    :html_url,
    :license,
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
      _links: {GitHubOpenAPI.LicenseContentLinks, :t},
      content: {:string, :generic},
      download_url: {:union, [{:string, :uri}, :null]},
      encoding: {:string, :generic},
      git_url: {:union, [{:string, :uri}, :null]},
      html_url: {:union, [{:string, :uri}, :null]},
      license: {:union, [{GitHubOpenAPI.LicenseSimple, :t}, :null]},
      name: {:string, :generic},
      path: {:string, :generic},
      sha: {:string, :generic},
      size: :integer,
      type: {:string, :generic},
      url: {:string, :uri}
    ]
  end
end
