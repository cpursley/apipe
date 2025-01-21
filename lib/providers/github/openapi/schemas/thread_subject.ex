defmodule GitHubOpenAPI.ThreadSubject do
  @moduledoc """
  Provides struct and type for a ThreadSubject
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          latest_comment_url: String.t(),
          title: String.t(),
          type: String.t(),
          url: String.t()
        }

  defstruct [:__info__, :__joins__, :latest_comment_url, :title, :type, :url]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      latest_comment_url: {:string, :generic},
      title: {:string, :generic},
      type: {:string, :generic},
      url: {:string, :generic}
    ]
  end
end
