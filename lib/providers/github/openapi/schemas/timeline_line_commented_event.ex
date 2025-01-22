defmodule GitHubOpenAPI.TimelineLineCommentedEvent do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :event, :string
    field :node_id, :string
    embeds_many :comments, GitHubOpenAPI.PullRequestReviewComment
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:event, :node_id, :__info__, :__joins__])
        |> cast_embed(:comments, with: &GitHubOpenAPI.PullRequestReviewComment.changeset/2)
  end
end
