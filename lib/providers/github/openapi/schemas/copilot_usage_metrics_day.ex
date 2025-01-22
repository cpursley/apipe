defmodule GitHubOpenAPI.CopilotUsageMetricsDay do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :date, :string
    field :total_active_users, :integer
    field :total_engaged_users, :integer
    embeds_one :copilot_dotcom_chat, GitHubOpenAPI.CopilotDotcomChat
    embeds_one :copilot_dotcom_pull_requests, GitHubOpenAPI.CopilotDotcomPullRequests
    embeds_one :copilot_ide_chat, GitHubOpenAPI.CopilotIdeChat
    embeds_one :copilot_ide_code_completions, GitHubOpenAPI.CopilotIdeCodeCompletions
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:date, :total_active_users, :total_engaged_users, :__info__, :__joins__])
        |> cast_embed(:copilot_dotcom_chat, with: &GitHubOpenAPI.CopilotDotcomChat.changeset/2)
    |> cast_embed(:copilot_dotcom_pull_requests, with: &GitHubOpenAPI.CopilotDotcomPullRequests.changeset/2)
    |> cast_embed(:copilot_ide_chat, with: &GitHubOpenAPI.CopilotIdeChat.changeset/2)
    |> cast_embed(:copilot_ide_code_completions, with: &GitHubOpenAPI.CopilotIdeCodeCompletions.changeset/2)
  end
end
