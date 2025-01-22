defmodule GitHubOpenAPI.OrganizationInvitation do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :created_at, :string
    field :email, :string
    field :failed_at, :string
    field :failed_reason, :string
    field :id, :integer
    field :invitation_source, :string
    field :invitation_teams_url, :string
    field :login, :string
    field :node_id, :string
    field :role, :string
    field :team_count, :integer
    embeds_one :inviter, GitHubOpenAPI.SimpleUser
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:created_at, :email, :failed_at, :failed_reason, :id, :invitation_source, :invitation_teams_url, :login, :node_id, :role, :team_count, :__info__, :__joins__])
        |> cast_embed(:inviter, with: &GitHubOpenAPI.SimpleUser.changeset/2)
  end
end
