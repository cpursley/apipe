defmodule GitHubOpenAPI.WebhooksReview do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :_links, :map
    field :author_association, Ecto.Enum, values: [:"COLLABORATOR", :"CONTRIBUTOR", :"FIRST_TIMER", :"FIRST_TIME_CONTRIBUTOR", :"MANNEQUIN", :"MEMBER", :"NONE", :"OWNER"]
    field :body, :string
    field :commit_id, :string
    field :html_url, :string
    field :id, :integer
    field :node_id, :string
    field :pull_request_url, :string
    field :state, :string
    field :submitted_at, :string
    field :user, :map
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:author_association, :body, :commit_id, :html_url, :id, :node_id, :pull_request_url, :state, :submitted_at, :__info__, :__joins__])
    
  end
end
