defmodule GitHubOpenAPI.GitTreeTree do
  @moduledoc """
  Provides struct and type for a GitTreeTree
  """
  use Apipe.Providers.OpenAPIEncoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          mode: String.t() | nil,
          path: String.t() | nil,
          sha: String.t() | nil,
          size: integer | nil,
          type: String.t() | nil,
          url: String.t() | nil
        }

  defstruct [:__info__, :__joins__, :mode, :path, :sha, :size, :type, :url]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      mode: {:string, :generic},
      path: {:string, :generic},
      sha: {:string, :generic},
      size: :integer,
      type: {:string, :generic},
      url: {:string, :generic}
    ]
  end
end
