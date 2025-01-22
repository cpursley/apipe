defmodule GitHubOpenAPI.TopicSearchResultItem do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :aliases, {:array, :string}
    field :created_at, :string
    field :created_by, :string
    field :curated, :boolean
    field :description, :string
    field :display_name, :string
    field :featured, :boolean
    field :logo_url, :string
    field :name, :string
    field :related, {:array, :string}
    field :released, :string
    field :repository_count, :integer
    field :score, :float
    field :short_description, :string
    field :updated_at, :string
    embeds_one :text_matches, GitHubOpenAPI.SearchResultTextMatches
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:aliases, :created_at, :created_by, :curated, :description, :display_name, :featured, :logo_url, :name, :related, :released, :repository_count, :score, :short_description, :updated_at, :__info__, :__joins__])
        |> cast_embed(:text_matches, with: &GitHubOpenAPI.SearchResultTextMatches.changeset/2)
  end
end
