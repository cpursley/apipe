defmodule GitHubOpenAPI.BaseGist do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :comments, :integer
    field :comments_enabled, :boolean
    field :comments_url, :string
    field :commits_url, :string
    field :created_at, :string
    field :description, :string
    field :files, {:map, :map}
    field :forks, {:array, :string}
    field :forks_url, :string
    field :git_pull_url, :string
    field :git_push_url, :string
    field :history, {:array, :string}
    field :html_url, :string
    field :id, :string
    field :node_id, :string
    field :public, :boolean
    field :truncated, :boolean
    field :updated_at, :string
    field :url, :string
    embeds_one :owner, GitHubOpenAPI.SimpleUser
    embeds_one :user, GitHubOpenAPI.NullableSimpleUser
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:comments, :comments_enabled, :comments_url, :commits_url, :created_at, :description, :forks, :forks_url, :git_pull_url, :git_push_url, :history, :html_url, :id, :node_id, :public, :truncated, :updated_at, :url, :__info__, :__joins__])
        |> cast_embed(:owner, with: &GitHubOpenAPI.SimpleUser.changeset/2)
    |> cast_embed(:user, with: &GitHubOpenAPI.NullableSimpleUser.changeset/2)
  end
end
