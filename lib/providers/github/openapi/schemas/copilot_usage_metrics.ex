defmodule GitHubOpenAPI.CopilotUsageMetrics do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :breakdown, {:array, :string}
    field :day, :string
    field :total_acceptances_count, :integer
    field :total_active_chat_users, :integer
    field :total_active_users, :integer
    field :total_chat_acceptances, :integer
    field :total_chat_turns, :integer
    field :total_lines_accepted, :integer
    field :total_lines_suggested, :integer
    field :total_suggestions_count, :integer
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:breakdown, :day, :total_acceptances_count, :total_active_chat_users, :total_active_users, :total_chat_acceptances, :total_chat_turns, :total_lines_accepted, :total_lines_suggested, :total_suggestions_count, :__info__, :__joins__])
    
  end
end
