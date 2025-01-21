defmodule GitHubOpenAPI.SecretScanningLocationDiscussionComment do
  @moduledoc """
  Provides struct and type for a SecretScanningLocationDiscussionComment
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{__info__: map, __joins__: map, discussion_comment_url: String.t()}

  defstruct [:__info__, :__joins__, :discussion_comment_url]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [discussion_comment_url: {:string, :uri}]
  end
end
