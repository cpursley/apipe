defmodule GitHubOpenAPI.IssueComment do
  @moduledoc """
  Provides struct and type for a IssueComment
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          author_association: String.t(),
          body: String.t() | nil,
          body_html: String.t() | nil,
          body_text: String.t() | nil,
          created_at: DateTime.t(),
          html_url: String.t(),
          id: integer,
          issue_url: String.t(),
          node_id: String.t(),
          performed_via_github_app: GitHubOpenAPI.NullableIntegration.t() | nil,
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
    :body_html,
    :body_text,
    :created_at,
    :html_url,
    :id,
    :issue_url,
    :node_id,
    :performed_via_github_app,
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
      body_html: {:string, :generic},
      body_text: {:string, :generic},
      created_at: {:string, :date_time},
      html_url: {:string, :uri},
      id: :integer,
      issue_url: {:string, :uri},
      node_id: {:string, :generic},
      performed_via_github_app: {GitHubOpenAPI.NullableIntegration, :t},
      reactions: {GitHubOpenAPI.ReactionRollup, :t},
      updated_at: {:string, :date_time},
      url: {:string, :uri},
      user: {GitHubOpenAPI.NullableSimpleUser, :t}
    ]
  end
end
