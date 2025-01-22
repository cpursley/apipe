defmodule GitHubOpenAPI.WebhooksIssueComment do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :author_association, Ecto.Enum, values: [:"COLLABORATOR", :"CONTRIBUTOR", :"FIRST_TIMER", :"FIRST_TIME_CONTRIBUTOR", :"MANNEQUIN", :"MEMBER", :"NONE", :"OWNER"]
    field :body, :string
    field :created_at, :string
    field :html_url, :string
    field :id, :integer
    field :issue_url, :string
    field :node_id, :string
    field :reactions, :map
    field :updated_at, :string
    field :url, :string
    field :user, :map
    embeds_one :performed_via_github_app, GitHubOpenAPI.Integration
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:author_association, :body, :created_at, :html_url, :id, :issue_url, :node_id, :updated_at, :url, :__info__, :__joins__])
        |> cast_embed(:performed_via_github_app, with: &GitHubOpenAPI.Integration.changeset/2)
  end
end
