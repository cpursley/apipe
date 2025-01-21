defmodule GitHubOpenAPI.TimelineCrossReferencedEventSource do
  @moduledoc """
  Provides struct and type for a TimelineCrossReferencedEventSource
  """
  use Apipe.Providers.OpenAPIEncoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          issue: GitHubOpenAPI.Issue.t() | nil,
          type: String.t() | nil
        }

  defstruct [:__info__, :__joins__, :issue, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [issue: {GitHubOpenAPI.Issue, :t}, type: {:string, :generic}]
  end
end
