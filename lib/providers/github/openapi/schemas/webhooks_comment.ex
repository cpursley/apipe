defmodule GitHubOpenAPI.WebhooksComment do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :author_association, Ecto.Enum, values: [:"COLLABORATOR", :"CONTRIBUTOR", :"FIRST_TIMER", :"FIRST_TIME_CONTRIBUTOR", :"MANNEQUIN", :"MEMBER", :"NONE", :"OWNER"]
    field :body, :string
    field :child_comment_count, :integer
    field :created_at, :string
    field :discussion_id, :integer
    field :html_url, :string
    field :id, :integer
    field :node_id, :string
    field :parent_id, :integer
    field :reactions, :map
    field :repository_url, :string
    field :updated_at, :string
    field :user, :map
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:author_association, :body, :child_comment_count, :created_at, :discussion_id, :html_url, :id, :node_id, :parent_id, :repository_url, :updated_at, :__info__, :__joins__])
    
  end
end
