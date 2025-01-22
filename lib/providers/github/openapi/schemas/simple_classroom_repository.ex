defmodule GitHubOpenAPI.SimpleClassroomRepository do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :default_branch, :string
    field :full_name, :string
    field :html_url, :string
    field :id, :integer
    field :node_id, :string
    field :private, :boolean
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:default_branch, :full_name, :html_url, :id, :node_id, :private, :__info__, :__joins__])
    
  end
end
