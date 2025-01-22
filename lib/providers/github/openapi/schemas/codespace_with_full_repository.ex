defmodule GitHubOpenAPI.CodespaceWithFullRepository do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :created_at, :string
    field :devcontainer_path, :string
    field :display_name, :string
    field :environment_id, :string
    field :git_status, :map
    field :id, :integer
    field :idle_timeout_minutes, :integer
    field :idle_timeout_notice, :string
    field :last_used_at, :string
    field :location, Ecto.Enum, values: [:"EastUs", :"SouthEastAsia", :"WestEurope", :"WestUs2"]
    field :machines_url, :string
    field :name, :string
    field :pending_operation, :boolean
    field :pending_operation_disabled_reason, :string
    field :prebuild, :boolean
    field :publish_url, :string
    field :pulls_url, :string
    field :recent_folders, {:array, :string}
    field :retention_expires_at, :string
    field :retention_period_minutes, :integer
    field :runtime_constraints, :map
    field :start_url, :string
    field :state, Ecto.Enum, values: [:"Unknown", :"Created", :"Queued", :"Provisioning", :"Available", :"Awaiting", :"Unavailable", :"Deleted", :"Moved", :"Shutdown", :"Archived", :"Starting", :"ShuttingDown", :"Failed", :"Exporting", :"Updating", :"Rebuilding"]
    field :stop_url, :string
    field :updated_at, :string
    field :url, :string
    field :web_url, :string
    embeds_one :billable_owner, GitHubOpenAPI.SimpleUser
    embeds_one :machine, GitHubOpenAPI.NullableCodespaceMachine
    embeds_one :owner, GitHubOpenAPI.SimpleUser
    embeds_one :repository, GitHubOpenAPI.FullRepository
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:created_at, :devcontainer_path, :display_name, :environment_id, :id, :idle_timeout_minutes, :idle_timeout_notice, :last_used_at, :location, :machines_url, :name, :pending_operation, :pending_operation_disabled_reason, :prebuild, :publish_url, :pulls_url, :recent_folders, :retention_expires_at, :retention_period_minutes, :start_url, :state, :stop_url, :updated_at, :url, :web_url, :__info__, :__joins__])
        |> cast_embed(:billable_owner, with: &GitHubOpenAPI.SimpleUser.changeset/2)
    |> cast_embed(:machine, with: &GitHubOpenAPI.NullableCodespaceMachine.changeset/2)
    |> cast_embed(:owner, with: &GitHubOpenAPI.SimpleUser.changeset/2)
    |> cast_embed(:repository, with: &GitHubOpenAPI.FullRepository.changeset/2)
  end
end
