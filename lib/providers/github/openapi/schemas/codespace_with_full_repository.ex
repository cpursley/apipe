defmodule GitHubOpenAPI.CodespaceWithFullRepository do
  @moduledoc """
  Provides struct and type for a CodespaceWithFullRepository
  """
  use Apipe.Providers.OpenAPIEncoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          billable_owner: GitHubOpenAPI.SimpleUser.t(),
          created_at: DateTime.t(),
          devcontainer_path: String.t() | nil,
          display_name: String.t() | nil,
          environment_id: String.t() | nil,
          git_status: GitHubOpenAPI.CodespaceWithFullRepositoryGitStatus.t(),
          id: integer,
          idle_timeout_minutes: integer | nil,
          idle_timeout_notice: String.t() | nil,
          last_used_at: DateTime.t(),
          location: String.t(),
          machine: GitHubOpenAPI.CodespaceMachine.t() | nil,
          machines_url: String.t(),
          name: String.t(),
          owner: GitHubOpenAPI.SimpleUser.t(),
          pending_operation: boolean | nil,
          pending_operation_disabled_reason: String.t() | nil,
          prebuild: boolean | nil,
          publish_url: String.t() | nil,
          pulls_url: String.t() | nil,
          recent_folders: [String.t()],
          repository: GitHubOpenAPI.FullRepository.t(),
          retention_expires_at: DateTime.t() | nil,
          retention_period_minutes: integer | nil,
          runtime_constraints:
            GitHubOpenAPI.CodespaceWithFullRepositoryRuntimeConstraints.t() | nil,
          start_url: String.t(),
          state: String.t(),
          stop_url: String.t(),
          updated_at: DateTime.t(),
          url: String.t(),
          web_url: String.t()
        }

  defstruct [
    :__info__,
    :__joins__,
    :billable_owner,
    :created_at,
    :devcontainer_path,
    :display_name,
    :environment_id,
    :git_status,
    :id,
    :idle_timeout_minutes,
    :idle_timeout_notice,
    :last_used_at,
    :location,
    :machine,
    :machines_url,
    :name,
    :owner,
    :pending_operation,
    :pending_operation_disabled_reason,
    :prebuild,
    :publish_url,
    :pulls_url,
    :recent_folders,
    :repository,
    :retention_expires_at,
    :retention_period_minutes,
    :runtime_constraints,
    :start_url,
    :state,
    :stop_url,
    :updated_at,
    :url,
    :web_url
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      billable_owner: {GitHubOpenAPI.SimpleUser, :t},
      created_at: {:string, :date_time},
      devcontainer_path: {:union, [{:string, :generic}, :null]},
      display_name: {:union, [{:string, :generic}, :null]},
      environment_id: {:union, [{:string, :generic}, :null]},
      git_status: {GitHubOpenAPI.CodespaceWithFullRepositoryGitStatus, :t},
      id: :integer,
      idle_timeout_minutes: {:union, [:integer, :null]},
      idle_timeout_notice: {:union, [{:string, :generic}, :null]},
      last_used_at: {:string, :date_time},
      location: {:enum, ["EastUs", "SouthEastAsia", "WestEurope", "WestUs2"]},
      machine: {:union, [{GitHubOpenAPI.CodespaceMachine, :t}, :null]},
      machines_url: {:string, :uri},
      name: {:string, :generic},
      owner: {GitHubOpenAPI.SimpleUser, :t},
      pending_operation: {:union, [:boolean, :null]},
      pending_operation_disabled_reason: {:union, [{:string, :generic}, :null]},
      prebuild: {:union, [:boolean, :null]},
      publish_url: {:union, [{:string, :uri}, :null]},
      pulls_url: {:union, [{:string, :uri}, :null]},
      recent_folders: [string: :generic],
      repository: {GitHubOpenAPI.FullRepository, :t},
      retention_expires_at: {:union, [{:string, :date_time}, :null]},
      retention_period_minutes: {:union, [:integer, :null]},
      runtime_constraints: {GitHubOpenAPI.CodespaceWithFullRepositoryRuntimeConstraints, :t},
      start_url: {:string, :uri},
      state:
        {:enum,
         [
           "Unknown",
           "Created",
           "Queued",
           "Provisioning",
           "Available",
           "Awaiting",
           "Unavailable",
           "Deleted",
           "Moved",
           "Shutdown",
           "Archived",
           "Starting",
           "ShuttingDown",
           "Failed",
           "Exporting",
           "Updating",
           "Rebuilding"
         ]},
      stop_url: {:string, :uri},
      updated_at: {:string, :date_time},
      url: {:string, :uri},
      web_url: {:string, :uri}
    ]
  end
end
