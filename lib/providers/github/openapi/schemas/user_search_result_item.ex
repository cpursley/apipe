defmodule GitHubOpenAPI.UserSearchResultItem do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :organizations_url, :string
    field :name, :string
    field :login, :string
    field :bio, :string
    field :email, :string
    field :score, :float
    field :company, :string
    field :following_url, :string
    field :starred_url, :string
    field :site_admin, :boolean
    field :followers_url, :string
    field :public_repos, :integer
    field :subscriptions_url, :string
    field :location, :string
    field :public_gists, :integer
    field :hireable, :boolean
    field :user_view_type, :string
    field :html_url, :string
    field :gists_url, :string
    field :gravatar_id, :string
    field :created_at, :string
    field :updated_at, :string
    field :events_url, :string
    field :avatar_url, :string
    field :url, :string
    field :type, :string
    field :node_id, :string
    field :suspended_at, :string
    field :repos_url, :string
    field :received_events_url, :string
    field :following, :integer
    field :blog, :string
    field :id, :integer
    field :followers, :integer
    embeds_one :text_matches, GitHubOpenAPI.SearchResultTextMatches
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:organizations_url, :name, :login, :bio, :email, :score, :company, :following_url, :starred_url, :site_admin, :followers_url, :public_repos, :subscriptions_url, :location, :public_gists, :hireable, :user_view_type, :html_url, :gists_url, :gravatar_id, :created_at, :updated_at, :events_url, :avatar_url, :url, :type, :node_id, :suspended_at, :repos_url, :received_events_url, :following, :blog, :id, :followers, :__info__, :__joins__])
        |> cast_embed(:text_matches, with: &GitHubOpenAPI.SearchResultTextMatches.changeset/2)
  end
end
