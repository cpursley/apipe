defmodule GitHubOpenAPI.GitTag do
  @moduledoc """
  Provides struct and type for a GitTag
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          message: String.t(),
          node_id: String.t(),
          object: GitHubOpenAPI.GitTagObject.t(),
          sha: String.t(),
          tag: String.t(),
          tagger: GitHubOpenAPI.GitTagTagger.t(),
          url: String.t(),
          verification: GitHubOpenAPI.Verification.t() | nil
        }

  defstruct [
    :__info__,
    :__joins__,
    :message,
    :node_id,
    :object,
    :sha,
    :tag,
    :tagger,
    :url,
    :verification
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      message: {:string, :generic},
      node_id: {:string, :generic},
      object: {GitHubOpenAPI.GitTagObject, :t},
      sha: {:string, :generic},
      tag: {:string, :generic},
      tagger: {GitHubOpenAPI.GitTagTagger, :t},
      url: {:string, :uri},
      verification: {GitHubOpenAPI.Verification, :t}
    ]
  end
end
