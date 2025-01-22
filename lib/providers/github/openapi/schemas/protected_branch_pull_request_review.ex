defmodule GitHubOpenAPI.ProtectedBranchPullRequestReview do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :bypass_pull_request_allowances, :map
    field :dismiss_stale_reviews, :boolean
    field :dismissal_restrictions, :map
    field :require_code_owner_reviews, :boolean
    field :require_last_push_approval, :boolean
    field :required_approving_review_count, :integer
    field :url, :string
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:dismiss_stale_reviews, :require_code_owner_reviews, :require_last_push_approval, :required_approving_review_count, :url, :__info__, :__joins__])
    
  end
end
