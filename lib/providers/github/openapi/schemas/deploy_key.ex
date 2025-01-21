defmodule GitHubOpenAPI.DeployKey do
  @moduledoc """
  Provides struct and type for a DeployKey
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          added_by: String.t() | nil,
          created_at: String.t(),
          enabled: boolean | nil,
          id: integer,
          key: String.t(),
          last_used: String.t() | nil,
          read_only: boolean,
          title: String.t(),
          url: String.t(),
          verified: boolean
        }

  defstruct [
    :__info__,
    :__joins__,
    :added_by,
    :created_at,
    :enabled,
    :id,
    :key,
    :last_used,
    :read_only,
    :title,
    :url,
    :verified
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      added_by: {:union, [{:string, :generic}, :null]},
      created_at: {:string, :generic},
      enabled: :boolean,
      id: :integer,
      key: {:string, :generic},
      last_used: {:union, [{:string, :generic}, :null]},
      read_only: :boolean,
      title: {:string, :generic},
      url: {:string, :generic},
      verified: :boolean
    ]
  end
end
