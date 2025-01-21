defmodule GitHubOpenAPI.RepositorySubscription do
  @moduledoc """
  Provides struct and type for a RepositorySubscription
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          created_at: DateTime.t(),
          ignored: boolean,
          reason: String.t() | nil,
          repository_url: String.t(),
          subscribed: boolean,
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
    :url
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      created_at: {:string, :date_time},
      ignored: :boolean,
      reason: {:union, [{:string, :generic}, :null]},
      repository_url: {:string, :uri},
      subscribed: :boolean,
      url: {:string, :uri}
    ]
  end
end
