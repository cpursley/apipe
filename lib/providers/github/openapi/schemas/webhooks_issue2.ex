defmodule GitHubOpenAPI.WebhooksIssue2 do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :active_lock_reason, Ecto.Enum, values: [:resolved, :"off-topic", :"too heated", :spam]
    field :assignee, :map
    field :assignees, {:array, :string}
    field :author_association, Ecto.Enum, values: [:"COLLABORATOR", :"CONTRIBUTOR", :"FIRST_TIMER", :"FIRST_TIME_CONTRIBUTOR", :"MANNEQUIN", :"MEMBER", :"NONE", :"OWNER"]
    field :body, :string
    field :closed_at, :string
    field :comments, :integer
    field :comments_url, :string
    field :created_at, :string
    field :draft, :boolean
    field :events_url, :string
    field :html_url, :string
    field :id, :integer
    field :labels, {:array, :string}
    field :labels_url, :string
    field :locked, :boolean
    field :milestone, :map
    field :node_id, :string
    field :number, :integer
    field :performed_via_github_app, :map
    field :pull_request, :map
    field :reactions, :map
    field :repository_url, :string
    field :state, Ecto.Enum, values: [:open, :closed]
    field :state_reason, :string
    field :sub_issues_summary, :map
    field :timeline_url, :string
    field :title, :string
    field :updated_at, :string
    field :url, :string
    field :user, :map
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:active_lock_reason, :assignees, :author_association, :body, :closed_at, :comments, :comments_url, :created_at, :draft, :events_url, :html_url, :id, :labels, :labels_url, :locked, :node_id, :number, :repository_url, :state, :state_reason, :timeline_url, :title, :updated_at, :url, :__info__, :__joins__])
    
  end
end
