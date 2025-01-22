defmodule GitHubOpenAPI.TimelineCommitCommentedEvent do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :commit_id, :string
    field :event, :string
    field :node_id, :string
    embeds_many :comments, GitHubOpenAPI.CommitComment
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:commit_id, :event, :node_id, :__info__, :__joins__])
        |> cast_embed(:comments, with: &GitHubOpenAPI.CommitComment.changeset/2)
  end
end
