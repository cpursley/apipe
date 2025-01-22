defmodule GitHubOpenAPI.CommitComment do
  @moduledoc """
  Provides struct and type for a CommitComment
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          author_association: String.t(),
          body: String.t(),
          commit_id: String.t(),
          created_at: DateTime.t(),
          html_url: String.t(),
          id: integer,
          line: integer | nil,
          node_id: String.t(),
          path: String.t() | nil,
          position: integer | nil,
          reactions: GitHubOpenAPI.ReactionRollup.t() | nil,
          updated_at: DateTime.t(),
          url: String.t(),
          user: GitHubOpenAPI.NullableSimpleUser.t()
        }

  defstruct [
    :__info__,
    :__joins__,
    :author_association,
    :body,
    :commit_id,
    :created_at,
    :html_url,
    :id,
    :line,
    :node_id,
    :path,
    :position,
    :reactions,
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
      commit_id: {:string, :generic},
      created_at: {:string, :date_time},
      html_url: {:string, :uri},
      id: :integer,
      line: :integer,
      node_id: {:string, :generic},
      path: {:string, :generic},
      position: :integer,
      reactions: {GitHubOpenAPI.ReactionRollup, :t},
      updated_at: {:string, :date_time},
      url: {:string, :uri},
      user: {GitHubOpenAPI.NullableSimpleUser, :t}
    ]
  end
end
