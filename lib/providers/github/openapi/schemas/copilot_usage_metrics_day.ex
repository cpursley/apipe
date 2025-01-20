defmodule GitHubOpenAPI.CopilotUsageMetricsDay do
  @moduledoc """
  Provides struct and type for a CopilotUsageMetricsDay
  """
  use Apipe.Providers.OpenAPIEncoder

  @type t :: %__MODULE__{
          __info__: map,
          copilot_dotcom_chat: GitHubOpenAPI.CopilotDotcomChat.t() | nil,
          copilot_dotcom_pull_requests: GitHubOpenAPI.CopilotDotcomPullRequests.t() | nil,
          copilot_ide_chat: GitHubOpenAPI.CopilotIdeChat.t() | nil,
          copilot_ide_code_completions: GitHubOpenAPI.CopilotIdeCodeCompletions.t() | nil,
          date: Date.t(),
          total_active_users: integer | nil,
          total_engaged_users: integer | nil
        }

  defstruct [
    :__info__,
    :copilot_dotcom_chat,
    :copilot_dotcom_pull_requests,
    :copilot_ide_chat,
    :copilot_ide_code_completions,
    :date,
    :total_active_users,
    :total_engaged_users
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      copilot_dotcom_chat: {:union, [{GitHubOpenAPI.CopilotDotcomChat, :t}, :null]},
      copilot_dotcom_pull_requests:
        {:union, [{GitHubOpenAPI.CopilotDotcomPullRequests, :t}, :null]},
      copilot_ide_chat: {:union, [{GitHubOpenAPI.CopilotIdeChat, :t}, :null]},
      copilot_ide_code_completions:
        {:union, [{GitHubOpenAPI.CopilotIdeCodeCompletions, :t}, :null]},
      date: {:string, :date},
      total_active_users: :integer,
      total_engaged_users: :integer
    ]
  end
end
