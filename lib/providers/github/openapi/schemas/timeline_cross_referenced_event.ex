defmodule GitHubOpenAPI.TimelineCrossReferencedEvent do
  @moduledoc """
  Provides struct and type for a TimelineCrossReferencedEvent
  """
  use Apipe.Providers.OpenAPIEncoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          actor: GitHubOpenAPI.SimpleUser.t() | nil,
          created_at: DateTime.t(),
          event: String.t(),
          source: GitHubOpenAPI.TimelineCrossReferencedEventSource.t(),
          updated_at: DateTime.t()
        }

  defstruct [:__info__, :__joins__, :actor, :created_at, :event, :source, :updated_at]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      actor: {GitHubOpenAPI.SimpleUser, :t},
      created_at: {:string, :date_time},
      event: {:string, :generic},
      source: {GitHubOpenAPI.TimelineCrossReferencedEventSource, :t},
      updated_at: {:string, :date_time}
    ]
  end
end
