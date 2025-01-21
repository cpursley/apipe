defmodule GitHubOpenAPI.ClassroomAcceptedAssignment do
  @moduledoc """
  Provides struct and type for a ClassroomAcceptedAssignment
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          assignment: GitHubOpenAPI.SimpleClassroomAssignment.t(),
          commit_count: integer,
          grade: String.t(),
          id: integer,
          passing: boolean,
          repository: GitHubOpenAPI.SimpleClassroomRepository.t(),
          students: [GitHubOpenAPI.SimpleClassroomUser.t()],
          submitted: boolean
        }

  defstruct [
    :__info__,
    :__joins__,
    :assignment,
    :commit_count,
    :grade,
    :id,
    :passing,
    :repository,
    :students,
    :submitted
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      assignment: {GitHubOpenAPI.SimpleClassroomAssignment, :t},
      commit_count: :integer,
      grade: {:string, :generic},
      id: :integer,
      passing: :boolean,
      repository: {GitHubOpenAPI.SimpleClassroomRepository, :t},
      students: [{GitHubOpenAPI.SimpleClassroomUser, :t}],
      submitted: :boolean
    ]
  end
end
