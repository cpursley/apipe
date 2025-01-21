defmodule GitHubOpenAPI.WorkflowRun do
  @moduledoc """
  Provides struct and type for a WorkflowRun
  """
  use Apipe.Providers.OpenAPIEncoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          actor: GitHubOpenAPI.SimpleUser.t() | nil,
          artifacts_url: String.t(),
          cancel_url: String.t(),
          check_suite_id: integer | nil,
          check_suite_node_id: String.t() | nil,
          check_suite_url: String.t(),
          conclusion: String.t() | nil,
          created_at: DateTime.t(),
          display_title: String.t(),
          event: String.t(),
          head_branch: String.t() | nil,
          head_commit: GitHubOpenAPI.SimpleCommit.t() | nil,
          head_repository: GitHubOpenAPI.MinimalRepository.t(),
          head_repository_id: integer | nil,
          head_sha: String.t(),
          html_url: String.t(),
          id: integer,
          jobs_url: String.t(),
          logs_url: String.t(),
          name: String.t() | nil,
          node_id: String.t(),
          path: String.t(),
          previous_attempt_url: String.t() | nil,
          pull_requests: [GitHubOpenAPI.PullRequestMinimal.t()] | nil,
          referenced_workflows: [map] | nil,
          repository: GitHubOpenAPI.MinimalRepository.t(),
          rerun_url: String.t(),
          run_attempt: integer | nil,
          run_number: integer,
          run_started_at: DateTime.t() | nil,
          status: String.t() | nil,
          triggering_actor: GitHubOpenAPI.SimpleUser.t() | nil,
          updated_at: DateTime.t(),
          url: String.t(),
          workflow_id: integer,
          workflow_url: String.t()
        }

  defstruct [
    :__info__,
    :__joins__,
    :actor,
    :artifacts_url,
    :cancel_url,
    :check_suite_id,
    :check_suite_node_id,
    :check_suite_url,
    :conclusion,
    :created_at,
    :display_title,
    :event,
    :head_branch,
    :head_commit,
    :head_repository,
    :head_repository_id,
    :head_sha,
    :html_url,
    :id,
    :jobs_url,
    :logs_url,
    :name,
    :node_id,
    :path,
    :previous_attempt_url,
    :pull_requests,
    :referenced_workflows,
    :repository,
    :rerun_url,
    :run_attempt,
    :run_number,
    :run_started_at,
    :status,
    :triggering_actor,
    :updated_at,
    :url,
    :workflow_id,
    :workflow_url
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      actor: {GitHubOpenAPI.SimpleUser, :t},
      artifacts_url: {:string, :generic},
      cancel_url: {:string, :generic},
      check_suite_id: :integer,
      check_suite_node_id: {:string, :generic},
      check_suite_url: {:string, :generic},
      conclusion: {:union, [{:string, :generic}, :null]},
      created_at: {:string, :date_time},
      display_title: {:string, :generic},
      event: {:string, :generic},
      head_branch: {:union, [{:string, :generic}, :null]},
      head_commit: {:union, [{GitHubOpenAPI.SimpleCommit, :t}, :null]},
      head_repository: {GitHubOpenAPI.MinimalRepository, :t},
      head_repository_id: :integer,
      head_sha: {:string, :generic},
      html_url: {:string, :generic},
      id: :integer,
      jobs_url: {:string, :generic},
      logs_url: {:string, :generic},
      name: {:union, [{:string, :generic}, :null]},
      node_id: {:string, :generic},
      path: {:string, :generic},
      previous_attempt_url: {:union, [{:string, :generic}, :null]},
      pull_requests: {:union, [[{GitHubOpenAPI.PullRequestMinimal, :t}], :null]},
      referenced_workflows: {:union, [[:map], :null]},
      repository: {GitHubOpenAPI.MinimalRepository, :t},
      rerun_url: {:string, :generic},
      run_attempt: :integer,
      run_number: :integer,
      run_started_at: {:string, :date_time},
      status: {:union, [{:string, :generic}, :null]},
      triggering_actor: {GitHubOpenAPI.SimpleUser, :t},
      updated_at: {:string, :date_time},
      url: {:string, :generic},
      workflow_id: :integer,
      workflow_url: {:string, :generic}
    ]
  end
end
