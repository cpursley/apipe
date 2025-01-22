defmodule GitHubOpenAPI.OrganizationSimpleWebhooks do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :avatar_url, :string
    field :description, :string
    field :events_url, :string
    field :hooks_url, :string
    field :id, :integer
    field :issues_url, :string
    field :login, :string
    field :members_url, :string
    field :node_id, :string
    field :public_members_url, :string
    field :repos_url, :string
    field :url, :string
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:avatar_url, :description, :events_url, :hooks_url, :id, :issues_url, :login, :members_url, :node_id, :public_members_url, :repos_url, :url, :__info__, :__joins__])
    
  end
end
