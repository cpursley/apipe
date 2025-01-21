defmodule GitHubOpenAPI.Reaction do
  @moduledoc """
  Provides struct and type for a Reaction
  """
  use Apipe.Providers.OpenAPIEncoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          content: String.t(),
          created_at: DateTime.t(),
          id: integer,
          node_id: String.t(),
          user: GitHubOpenAPI.SimpleUser.t() | nil
        }

  defstruct [:__info__, :__joins__, :content, :created_at, :id, :node_id, :user]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      content: {:enum, ["+1", "-1", "laugh", "confused", "heart", "hooray", "rocket", "eyes"]},
      created_at: {:string, :date_time},
      id: :integer,
      node_id: {:string, :generic},
      user: {:union, [{GitHubOpenAPI.SimpleUser, :t}, :null]}
    ]
  end
end
