defmodule GitHubOpenAPI.CheckSuite do
  @moduledoc """
  Provides struct and type for a CheckSuite
  """
  use Apipe.Providers.OpenAPIEncoder

  @type t :: %__MODULE__{
          __info__: map,
          after: String.t() | nil,
          app: GitHubOpenAPI.Integration.t() | nil,
          before: String.t() | nil,
          check_runs_url: String.t(),
          conclusion: String.t() | nil,
          created_at: DateTime.t() | nil,
          head_branch: String.t() | nil,
          head_commit: GitHubOpenAPI.SimpleCommit.t(),
          head_sha: String.t(),
          id: integer,
          latest_check_runs_count: integer,
          node_id: String.t(),
          pull_requests: [GitHubOpenAPI.PullRequestMinimal.t()] | nil,
          repository: GitHubOpenAPI.MinimalRepository.t(),
          rerequestable: boolean | nil,
          runs_rerequestable: boolean | nil,
          status: String.t() | nil,
          updated_at: DateTime.t() | nil,
          url: String.t() | nil
        }

  defstruct [
    :__info__,
    :after,
    :app,
    :before,
    :check_runs_url,
    :conclusion,
    :created_at,
    :head_branch,
    :head_commit,
    :head_sha,
    :id,
    :latest_check_runs_count,
    :node_id,
    :pull_requests,
    :repository,
    :rerequestable,
    :runs_rerequestable,
    :status,
    :updated_at,
    :url
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      after: {:union, [{:string, :generic}, :null]},
      app: {:union, [{GitHubOpenAPI.Integration, :t}, :null]},
      before: {:union, [{:string, :generic}, :null]},
      check_runs_url: {:string, :generic},
      conclusion:
        {:enum,
         [
           "success",
           "failure",
           "neutral",
           "cancelled",
           "skipped",
           "timed_out",
           "action_required",
           "startup_failure",
           "stale",
           nil
         ]},
      created_at: {:union, [{:string, :date_time}, :null]},
      head_branch: {:union, [{:string, :generic}, :null]},
      head_commit: {GitHubOpenAPI.SimpleCommit, :t},
      head_sha: {:string, :generic},
      id: :integer,
      latest_check_runs_count: :integer,
      node_id: {:string, :generic},
      pull_requests: {:union, [[{GitHubOpenAPI.PullRequestMinimal, :t}], :null]},
      repository: {GitHubOpenAPI.MinimalRepository, :t},
      rerequestable: :boolean,
      runs_rerequestable: :boolean,
      status:
        {:enum, ["queued", "in_progress", "completed", "waiting", "requested", "pending", nil]},
      updated_at: {:union, [{:string, :date_time}, :null]},
      url: {:union, [{:string, :generic}, :null]}
    ]
  end
end
