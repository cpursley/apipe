defmodule GitHubOpenAPI.RepositoryRuleParamsRequiredReviewerConfiguration do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :file_patterns, {:array, :string}
    field :minimum_approvals, :integer
    field :reviewer_id, :string
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:file_patterns, :minimum_approvals, :reviewer_id, :__info__, :__joins__])
    
  end
end
