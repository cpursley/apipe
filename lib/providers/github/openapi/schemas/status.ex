defmodule GitHubOpenAPI.Status do
  @moduledoc """
  Provides struct and type for a Status
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          avatar_url: String.t() | nil,
          context: String.t(),
          created_at: String.t(),
          creator: GitHubOpenAPI.SimpleUser.t() | nil,
          description: String.t() | nil,
          id: integer,
          node_id: String.t(),
          state: String.t(),
          target_url: String.t() | nil,
          updated_at: String.t(),
          url: String.t()
        }

  defstruct [
    :__info__,
    :__joins__,
    :avatar_url,
    :context,
    :created_at,
    :creator,
    :description,
    :id,
    :node_id,
    :state,
    :target_url,
    :updated_at,
    :url
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      avatar_url: {:union, [{:string, :generic}, :null]},
      context: {:string, :generic},
      created_at: {:string, :generic},
      creator: {:union, [{GitHubOpenAPI.SimpleUser, :t}, :null]},
      description: {:union, [{:string, :generic}, :null]},
      id: :integer,
      node_id: {:string, :generic},
      state: {:string, :generic},
      target_url: {:union, [{:string, :generic}, :null]},
      updated_at: {:string, :generic},
      url: {:string, :generic}
    ]
  end
end
