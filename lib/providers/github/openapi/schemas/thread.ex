defmodule GitHubOpenAPI.Thread do
  @moduledoc """
  Provides struct and type for a Thread
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          id: String.t(),
          last_read_at: String.t() | nil,
          reason: String.t(),
          repository: GitHubOpenAPI.MinimalRepository.t(),
          subject: GitHubOpenAPI.ThreadSubject.t(),
          subscription_url: String.t(),
          unread: boolean,
          updated_at: String.t(),
          url: String.t()
        }

  defstruct [
    :__info__,
    :__joins__,
    :id,
    :last_read_at,
    :reason,
    :repository,
    :subject,
    :subscription_url,
    :unread,
    :updated_at,
    :url
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      id: {:string, :generic},
      last_read_at: {:string, :generic},
      reason: {:string, :generic},
      repository: {GitHubOpenAPI.MinimalRepository, :t},
      subject: {GitHubOpenAPI.ThreadSubject, :t},
      subscription_url: {:string, :generic},
      unread: :boolean,
      updated_at: {:string, :generic},
      url: {:string, :generic}
    ]
  end
end
