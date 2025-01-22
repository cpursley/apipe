defmodule GitHubOpenAPI.EnterpriseTeam do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :created_at, :string
    field :group_id, :string
    field :group_name, :string
    field :html_url, :string
    field :id, :integer
    field :members_url, :string
    field :name, :string
    field :slug, :string
    field :sync_to_organizations, :string
    field :updated_at, :string
    field :url, :string
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:created_at, :group_id, :group_name, :html_url, :id, :members_url, :name, :slug, :sync_to_organizations, :updated_at, :url, :__info__, :__joins__])
    
  end
end
