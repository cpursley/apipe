defmodule GitHubOpenAPI.SimpleClassroomOrganization do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :avatar_url, :string
    field :html_url, :string
    field :id, :integer
    field :login, :string
    field :name, :string
    field :node_id, :string
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:avatar_url, :html_url, :id, :login, :name, :node_id, :__info__, :__joins__])
    
  end
end
