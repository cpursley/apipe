defmodule GitHubOpenAPI.SecretScanningLocationWikiCommit do
  @moduledoc """
  Provides struct and type for a SecretScanningLocationWikiCommit
  """
  use Apipe.Providers.OpenAPIEncoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          blob_sha: String.t(),
          commit_sha: String.t(),
          commit_url: String.t(),
          end_column: number,
          end_line: number,
          page_url: String.t(),
          path: String.t(),
          start_column: number,
          start_line: number
        }

  defstruct [
    :__info__,
    :__joins__,
    :blob_sha,
    :commit_sha,
    :commit_url,
    :end_column,
    :end_line,
    :page_url,
    :path,
    :start_column,
    :start_line
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      blob_sha: {:string, :generic},
      commit_sha: {:string, :generic},
      commit_url: {:string, :generic},
      end_column: :number,
      end_line: :number,
      page_url: {:string, :generic},
      path: {:string, :generic},
      start_column: :number,
      start_line: :number
    ]
  end
end
