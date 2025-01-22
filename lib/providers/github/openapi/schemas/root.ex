defmodule GitHubOpenAPI.Root do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :commit_search_url, :string
    field :current_user_url, :string
    field :organization_url, :string
    field :label_search_url, :string
    field :code_search_url, :string
    field :emails_url, :string
    field :following_url, :string
    field :issue_search_url, :string
    field :topic_search_url, :string
    field :starred_url, :string
    field :issues_url, :string
    field :hub_url, :string
    field :user_search_url, :string
    field :followers_url, :string
    field :organization_teams_url, :string
    field :authorizations_url, :string
    field :organization_repositories_url, :string
    field :current_user_authorizations_html_url, :string
    field :user_url, :string
    field :feeds_url, :string
    field :rate_limit_url, :string
    field :emojis_url, :string
    field :repository_search_url, :string
    field :gists_url, :string
    field :events_url, :string
    field :repository_url, :string
    field :current_user_repositories_url, :string
    field :starred_gists_url, :string
    field :notifications_url, :string
    field :public_gists_url, :string
    field :user_repositories_url, :string
    field :keys_url, :string
    field :user_organizations_url, :string
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:commit_search_url, :current_user_url, :organization_url, :label_search_url, :code_search_url, :emails_url, :following_url, :issue_search_url, :topic_search_url, :starred_url, :issues_url, :hub_url, :user_search_url, :followers_url, :organization_teams_url, :authorizations_url, :organization_repositories_url, :current_user_authorizations_html_url, :user_url, :feeds_url, :rate_limit_url, :emojis_url, :repository_search_url, :gists_url, :events_url, :repository_url, :current_user_repositories_url, :starred_gists_url, :notifications_url, :public_gists_url, :user_repositories_url, :keys_url, :user_organizations_url, :__info__, :__joins__])
    
  end
end
