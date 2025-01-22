defmodule GitHubOpenAPI.ClassroomAssignment do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :accepted, :integer
    field :deadline, :string
    field :editor, :string
    field :feedback_pull_requests_enabled, :boolean
    field :id, :integer
    field :invitations_enabled, :boolean
    field :invite_link, :string
    field :language, :string
    field :max_members, :integer
    field :max_teams, :integer
    field :passing, :integer
    field :public_repo, :boolean
    field :slug, :string
    field :students_are_repo_admins, :boolean
    field :submitted, :integer
    field :title, :string
    field :type, Ecto.Enum, values: [:individual, :group]
    embeds_one :classroom, GitHubOpenAPI.Classroom
    embeds_one :starter_code_repository, GitHubOpenAPI.SimpleClassroomRepository
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:accepted, :deadline, :editor, :feedback_pull_requests_enabled, :id, :invitations_enabled, :invite_link, :language, :max_members, :max_teams, :passing, :public_repo, :slug, :students_are_repo_admins, :submitted, :title, :type, :__info__, :__joins__])
        |> cast_embed(:classroom, with: &GitHubOpenAPI.Classroom.changeset/2)
    |> cast_embed(:starter_code_repository, with: &GitHubOpenAPI.SimpleClassroomRepository.changeset/2)
  end
end
