defmodule GitHubOpenAPI.ShortBranch do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :commit, :map
    field :name, :string
    field :protected, :boolean
    field :protection_url, :string
    embeds_one :protection, GitHubOpenAPI.BranchProtection
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:name, :protected, :protection_url, :__info__, :__joins__])
        |> cast_embed(:protection, with: &GitHubOpenAPI.BranchProtection.changeset/2)
  end
end
