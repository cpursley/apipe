defmodule GitHubOpenAPI.ThreadSubscription do
  @moduledoc """
  Provides struct and type for a ThreadSubscription
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          created_at: DateTime.t() | nil,
          ignored: boolean,
          reason: String.t() | nil,
          repository_url: String.t() | nil,
          subscribed: boolean,
          thread_url: String.t() | nil,
          url: String.t()
        }

  defstruct [
    :__info__,
    :__joins__,
    :created_at,
    :ignored,
    :reason,
    :repository_url,
    :subscribed,
    :thread_url,
    :url
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      created_at: {:string, :date_time},
      ignored: :boolean,
      reason: {:string, :generic},
      repository_url: {:string, :uri},
      subscribed: :boolean,
      thread_url: {:string, :uri},
      url: {:string, :uri}
    ]
  end
end
