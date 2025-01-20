defmodule GitHubOpenAPI.SecretScanningLocationDiscussionBody do
  @moduledoc """
  Provides struct and type for a SecretScanningLocationDiscussionBody
  """
  use Apipe.Providers.OpenAPIEncoder

  @type t :: %__MODULE__{__info__: map, discussion_body_url: String.t()}

  defstruct [:__info__, :discussion_body_url]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [discussion_body_url: {:string, :uri}]
  end
end
