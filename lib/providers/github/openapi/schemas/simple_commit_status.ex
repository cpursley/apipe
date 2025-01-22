defmodule GitHubOpenAPI.SimpleCommitStatus do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :avatar_url, :string
    field :context, :string
    field :created_at, :string
    field :description, :string
    field :id, :integer
    field :node_id, :string
    field :required, :boolean
    field :state, :string
    field :target_url, :string
    field :updated_at, :string
    field :url, :string
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:avatar_url, :context, :created_at, :description, :id, :node_id, :required, :state, :target_url, :updated_at, :url, :__info__, :__joins__])
    
  end
end
