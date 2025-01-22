defmodule GitHubOpenAPI.LicenseContent do
  @moduledoc """
  Provides struct and type for a LicenseContent
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          _links: GitHubOpenAPI.LicenseContentLinks.t(),
          content: String.t(),
          download_url: String.t() | nil,
          encoding: String.t(),
          git_url: String.t() | nil,
          html_url: String.t() | nil,
          license: GitHubOpenAPI.NullableLicenseSimple.t(),
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
      download_url: {:string, :uri},
      encoding: {:string, :generic},
      git_url: {:string, :uri},
      html_url: {:string, :uri},
      license: {GitHubOpenAPI.NullableLicenseSimple, :t},
      name: {:string, :generic},
      path: {:string, :generic},
      sha: {:string, :generic},
      size: :integer,
      type: {:string, :generic},
      url: {:string, :uri}
    ]
  end
end
