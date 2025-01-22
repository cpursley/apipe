defmodule GitHubOpenAPI.BranchWithProtection do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :_links, :map
    field :name, :string
    field :pattern, :string
    field :protected, :boolean
    field :protection_url, :string
    field :required_approving_review_count, :integer
    embeds_one :commit, GitHubOpenAPI.Commit
    embeds_one :protection, GitHubOpenAPI.BranchProtection
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:name, :pattern, :protected, :protection_url, :required_approving_review_count, :__info__, :__joins__])
        |> cast_embed(:commit, with: &GitHubOpenAPI.Commit.changeset/2)
    |> cast_embed(:protection, with: &GitHubOpenAPI.BranchProtection.changeset/2)
  end
end
