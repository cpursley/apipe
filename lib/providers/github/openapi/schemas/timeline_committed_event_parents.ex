defmodule GitHubOpenAPI.TimelineCommittedEventParents do
  @moduledoc """
  Provides struct and type for a TimelineCommittedEventParents
  """
  use Apipe.Providers.OpenAPIEncoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          html_url: String.t(),
          sha: String.t(),
          url: String.t()
        }

  defstruct [:__info__, :__joins__, :html_url, :sha, :url]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [html_url: {:string, :uri}, sha: {:string, :generic}, url: {:string, :uri}]
  end
end
