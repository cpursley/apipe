defmodule GitHubOpenAPI.SimpleCommitStatus do
  @moduledoc """
  Provides struct and type for a SimpleCommitStatus
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          avatar_url: String.t() | nil,
          context: String.t(),
          created_at: DateTime.t(),
          description: String.t() | nil,
          id: integer,
          node_id: String.t(),
          required: boolean | nil,
          state: String.t(),
          target_url: String.t() | nil,
          updated_at: DateTime.t(),
          url: String.t()
        }

  defstruct [
    :__info__,
    :__joins__,
    :avatar_url,
    :context,
    :created_at,
    :description,
    :id,
    :node_id,
    :required,
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
      avatar_url: {:string, :uri},
      context: {:string, :generic},
      created_at: {:string, :date_time},
      description: {:string, :generic},
      id: :integer,
      node_id: {:string, :generic},
      required: :boolean,
      state: {:string, :generic},
      target_url: {:string, :uri},
      updated_at: {:string, :date_time},
      url: {:string, :uri}
    ]
  end
end
