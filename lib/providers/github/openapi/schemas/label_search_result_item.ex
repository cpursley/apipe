defmodule GitHubOpenAPI.LabelSearchResultItem do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :color, :string
    field :default, :boolean
    field :description, :string
    field :id, :integer
    field :name, :string
    field :node_id, :string
    field :score, :float
    field :url, :string
    embeds_one :text_matches, GitHubOpenAPI.SearchResultTextMatches
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:color, :default, :description, :id, :name, :node_id, :score, :url, :__info__, :__joins__])
        |> cast_embed(:text_matches, with: &GitHubOpenAPI.SearchResultTextMatches.changeset/2)
  end
end
