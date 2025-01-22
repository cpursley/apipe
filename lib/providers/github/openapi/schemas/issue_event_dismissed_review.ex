defmodule GitHubOpenAPI.IssueEventDismissedReview do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :dismissal_commit_id, :string
    field :dismissal_message, :string
    field :review_id, :integer
    field :state, :string
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:dismissal_commit_id, :dismissal_message, :review_id, :state, :__info__, :__joins__])
    
  end
end
