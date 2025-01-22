defmodule GitHubOpenAPI.WebhooksReviewComment do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :_links, :map
    field :author_association, Ecto.Enum, values: [:"COLLABORATOR", :"CONTRIBUTOR", :"FIRST_TIMER", :"FIRST_TIME_CONTRIBUTOR", :"MANNEQUIN", :"MEMBER", :"NONE", :"OWNER"]
    field :body, :string
    field :commit_id, :string
    field :created_at, :string
    field :diff_hunk, :string
    field :html_url, :string
    field :id, :integer
    field :in_reply_to_id, :integer
    field :line, :integer
    field :node_id, :string
    field :original_commit_id, :string
    field :original_line, :integer
    field :original_position, :integer
    field :original_start_line, :integer
    field :path, :string
    field :position, :integer
    field :pull_request_review_id, :integer
    field :pull_request_url, :string
    field :reactions, :map
    field :side, Ecto.Enum, values: [:"LEFT", :"RIGHT"]
    field :start_line, :integer
    field :start_side, Ecto.Enum, values: [:"LEFT", :"RIGHT"]
    field :subject_type, Ecto.Enum, values: [:line, :file]
    field :updated_at, :string
    field :url, :string
    field :user, :map
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:author_association, :body, :commit_id, :created_at, :diff_hunk, :html_url, :id, :in_reply_to_id, :line, :node_id, :original_commit_id, :original_line, :original_position, :original_start_line, :path, :position, :pull_request_review_id, :pull_request_url, :side, :start_line, :start_side, :subject_type, :updated_at, :url, :__info__, :__joins__])
    
  end
end
