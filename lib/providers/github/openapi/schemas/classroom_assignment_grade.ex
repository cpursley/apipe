defmodule GitHubOpenAPI.ClassroomAssignmentGrade do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :assignment_name, :string
    field :assignment_url, :string
    field :github_username, :string
    field :group_name, :string
    field :points_available, :integer
    field :points_awarded, :integer
    field :roster_identifier, :string
    field :starter_code_url, :string
    field :student_repository_name, :string
    field :student_repository_url, :string
    field :submission_timestamp, :string
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:assignment_name, :assignment_url, :github_username, :group_name, :points_available, :points_awarded, :roster_identifier, :starter_code_url, :student_repository_name, :student_repository_url, :submission_timestamp, :__info__, :__joins__])
    
  end
end
