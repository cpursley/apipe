defmodule GitHubOpenAPI.ActionsPublicKey do
  @moduledoc """
  Provides struct and type for a ActionsPublicKey
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          created_at: String.t() | nil,
          id: integer | nil,
          key: String.t(),
          key_id: String.t(),
          title: String.t() | nil,
          url: String.t() | nil
        }

  defstruct [:__info__, :__joins__, :created_at, :id, :key, :key_id, :title, :url]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      created_at: {:string, :generic},
      id: :integer,
      key: {:string, :generic},
      key_id: {:string, :generic},
      title: {:string, :generic},
      url: {:string, :generic}
    ]
  end
end
