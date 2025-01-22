defmodule GitHubOpenAPI.PullRequestReviewComment do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :_links, :map
    field :body, :string
    field :body_html, :string
    field :body_text, :string
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
    field :side, Ecto.Enum, values: [:"LEFT", :"RIGHT"]
    field :start_line, :integer
    field :start_side, Ecto.Enum, values: [:"LEFT", :"RIGHT"]
    field :subject_type, Ecto.Enum, values: [:line, :file]
    field :updated_at, :string
    field :url, :string
    embeds_one :author_association, GitHubOpenAPI.AuthorAssociation
    embeds_one :reactions, GitHubOpenAPI.ReactionRollup
    embeds_one :user, GitHubOpenAPI.SimpleUser
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:body, :body_html, :body_text, :commit_id, :created_at, :diff_hunk, :html_url, :id, :in_reply_to_id, :line, :node_id, :original_commit_id, :original_line, :original_position, :original_start_line, :path, :position, :pull_request_review_id, :pull_request_url, :side, :start_line, :start_side, :subject_type, :updated_at, :url, :__info__, :__joins__])
        |> cast_embed(:author_association, with: &GitHubOpenAPI.AuthorAssociation.changeset/2)
    |> cast_embed(:reactions, with: &GitHubOpenAPI.ReactionRollup.changeset/2)
    |> cast_embed(:user, with: &GitHubOpenAPI.SimpleUser.changeset/2)
  end
end
