defmodule GitHubOpenAPI.NullableSimpleUser do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :avatar_url, :string
    field :email, :string
    field :events_url, :string
    field :followers_url, :string
    field :following_url, :string
    field :gists_url, :string
    field :gravatar_id, :string
    field :html_url, :string
    field :id, :integer
    field :login, :string
    field :name, :string
    field :node_id, :string
    field :organizations_url, :string
    field :received_events_url, :string
    field :repos_url, :string
    field :site_admin, :boolean
    field :starred_at, :string
    field :starred_url, :string
    field :subscriptions_url, :string
    field :type, :string
    field :url, :string
    field :user_view_type, :string
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:avatar_url, :email, :events_url, :followers_url, :following_url, :gists_url, :gravatar_id, :html_url, :id, :login, :name, :node_id, :organizations_url, :received_events_url, :repos_url, :site_admin, :starred_at, :starred_url, :subscriptions_url, :type, :url, :user_view_type, :__info__, :__joins__])
    
  end
end
