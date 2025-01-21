defmodule GitHubOpenAPI.TimelineReviewedEventLinksPullRequest do
  @moduledoc """
  Provides struct and type for a TimelineReviewedEventLinksPullRequest
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{__info__: map, __joins__: map, href: String.t()}

  defstruct [:__info__, :__joins__, :href]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [href: {:string, :generic}]
  end
end
