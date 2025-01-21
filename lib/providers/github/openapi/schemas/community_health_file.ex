defmodule GitHubOpenAPI.CommunityHealthFile do
  @moduledoc """
  Provides struct and type for a CommunityHealthFile
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{__info__: map, __joins__: map, html_url: String.t(), url: String.t()}

  defstruct [:__info__, :__joins__, :html_url, :url]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [html_url: {:string, :uri}, url: {:string, :uri}]
  end
end
