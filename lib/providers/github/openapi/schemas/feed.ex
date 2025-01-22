defmodule GitHubOpenAPI.Feed do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :_links, :map
    field :current_user_actor_url, :string
    field :current_user_organization_url, :string
    field :current_user_organization_urls, {:array, :string}
    field :current_user_public_url, :string
    field :current_user_url, :string
    field :repository_discussions_category_url, :string
    field :repository_discussions_url, :string
    field :security_advisories_url, :string
    field :timeline_url, :string
    field :user_url, :string
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:current_user_actor_url, :current_user_organization_url, :current_user_organization_urls, :current_user_public_url, :current_user_url, :repository_discussions_category_url, :repository_discussions_url, :security_advisories_url, :timeline_url, :user_url, :__info__, :__joins__])
    
  end
end
