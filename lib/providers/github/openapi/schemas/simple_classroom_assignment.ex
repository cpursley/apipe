defmodule GitHubOpenAPI.SimpleClassroomAssignment do
  @moduledoc """
  Provides struct and type for a SimpleClassroomAssignment
  """
  use Apipe.Providers.OpenAPIEncoder

  @type t :: %__MODULE__{
          __info__: map,
          accepted: integer,
          classroom: GitHubOpenAPI.SimpleClassroom.t(),
          deadline: DateTime.t() | nil,
          editor: String.t(),
          feedback_pull_requests_enabled: boolean,
          id: integer,
          invitations_enabled: boolean,
          invite_link: String.t(),
          language: String.t(),
          max_members: integer | nil,
          max_teams: integer | nil,
          passing: integer,
          public_repo: boolean,
          slug: String.t(),
          students_are_repo_admins: boolean,
          submitted: integer,
          title: String.t(),
          type: String.t()
        }

  defstruct [
    :__info__,
    :accepted,
    :classroom,
    :deadline,
    :editor,
    :feedback_pull_requests_enabled,
    :id,
    :invitations_enabled,
    :invite_link,
    :language,
    :max_members,
    :max_teams,
    :passing,
    :public_repo,
    :slug,
    :students_are_repo_admins,
    :submitted,
    :title,
    :type
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      accepted: :integer,
      classroom: {GitHubOpenAPI.SimpleClassroom, :t},
      deadline: {:union, [{:string, :date_time}, :null]},
      editor: {:string, :generic},
      feedback_pull_requests_enabled: :boolean,
      id: :integer,
      invitations_enabled: :boolean,
      invite_link: {:string, :generic},
      language: {:string, :generic},
      max_members: {:union, [:integer, :null]},
      max_teams: {:union, [:integer, :null]},
      passing: :integer,
      public_repo: :boolean,
      slug: {:string, :generic},
      students_are_repo_admins: :boolean,
      submitted: :integer,
      title: {:string, :generic},
      type: {:enum, ["individual", "group"]}
    ]
  end
end
