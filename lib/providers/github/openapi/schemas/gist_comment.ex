defmodule GitHubOpenAPI.GistComment do
  @moduledoc """
  Provides struct and type for a GistComment
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          author_association: String.t(),
          body: String.t(),
          created_at: DateTime.t(),
          id: integer,
          node_id: String.t(),
          updated_at: DateTime.t(),
          url: String.t(),
          user: GitHubOpenAPI.NullableSimpleUser.t()
        }

  defstruct [
    :__info__,
    :__joins__,
    :author_association,
    :body,
    :created_at,
    :id,
    :node_id,
    :updated_at,
    :url,
    :user
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      author_association:
        {:enum,
         [
           "COLLABORATOR",
           "CONTRIBUTOR",
           "FIRST_TIMER",
           "FIRST_TIME_CONTRIBUTOR",
           "MANNEQUIN",
           "MEMBER",
           "NONE",
           "OWNER"
         ]},
      body: {:string, :generic},
      created_at: {:string, :date_time},
      id: :integer,
      node_id: {:string, :generic},
      updated_at: {:string, :date_time},
      url: {:string, :uri},
      user: {GitHubOpenAPI.NullableSimpleUser, :t}
    ]
  end
end
