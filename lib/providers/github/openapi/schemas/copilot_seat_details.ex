defmodule GitHubOpenAPI.CopilotSeatDetails do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :assigning_team, :map
    field :created_at, :string
    field :last_activity_at, :string
    field :last_activity_editor, :string
    field :pending_cancellation_date, :string
    field :plan_type, Ecto.Enum, values: [:business, :enterprise, :unknown]
    field :updated_at, :string
    embeds_one :assignee, GitHubOpenAPI.SimpleUser
    embeds_one :organization, GitHubOpenAPI.NullableOrganizationSimple
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:assigning_team, :created_at, :last_activity_at, :last_activity_editor, :pending_cancellation_date, :plan_type, :updated_at, :__info__, :__joins__])
        |> cast_embed(:assignee, with: &GitHubOpenAPI.SimpleUser.changeset/2)
    |> cast_embed(:organization, with: &GitHubOpenAPI.NullableOrganizationSimple.changeset/2)
  end
end
