defmodule GitHubOpenAPI.ClassroomAcceptedAssignment do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :commit_count, :integer
    field :grade, :string
    field :id, :integer
    field :passing, :boolean
    field :submitted, :boolean
    embeds_one :assignment, GitHubOpenAPI.SimpleClassroomAssignment
    embeds_one :repository, GitHubOpenAPI.SimpleClassroomRepository
    embeds_many :students, GitHubOpenAPI.SimpleClassroomUser
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:commit_count, :grade, :id, :passing, :submitted, :__info__, :__joins__])
        |> cast_embed(:assignment, with: &GitHubOpenAPI.SimpleClassroomAssignment.changeset/2)
    |> cast_embed(:repository, with: &GitHubOpenAPI.SimpleClassroomRepository.changeset/2)
    |> cast_embed(:students, with: &GitHubOpenAPI.SimpleClassroomUser.changeset/2)
  end
end
