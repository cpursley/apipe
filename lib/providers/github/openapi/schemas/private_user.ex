defmodule GitHubOpenAPI.PrivateUser do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :organizations_url, :string
    field :name, :string
    field :private_gists, :integer
    field :ldap_dn, :string
    field :login, :string
    field :two_factor_authentication, :boolean
    field :bio, :string
    field :business_plus, :boolean
    field :email, :string
    field :company, :string
    field :following_url, :string
    field :starred_url, :string
    field :owned_private_repos, :integer
    field :total_private_repos, :integer
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
    field :collaborators, :integer
    field :events_url, :string
    field :disk_usage, :integer
    field :avatar_url, :string
    field :url, :string
    field :type, :string
    field :node_id, :string
    field :twitter_username, :string
    field :repos_url, :string
    field :received_events_url, :string
    field :following, :integer
    field :notification_email, :string
    field :blog, :string
    field :id, :integer
    field :followers, :integer
    field :plan, :map
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:organizations_url, :name, :private_gists, :ldap_dn, :login, :two_factor_authentication, :bio, :business_plus, :email, :company, :following_url, :starred_url, :owned_private_repos, :total_private_repos, :site_admin, :followers_url, :public_repos, :subscriptions_url, :location, :public_gists, :hireable, :user_view_type, :html_url, :gists_url, :gravatar_id, :created_at, :updated_at, :collaborators, :events_url, :disk_usage, :avatar_url, :url, :type, :node_id, :twitter_username, :repos_url, :received_events_url, :following, :notification_email, :blog, :id, :followers, :__info__, :__joins__])
    
  end
end
