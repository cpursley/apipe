defmodule GitHubOpenAPI.PorterAuthor do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :email, :string
    field :id, :integer
    field :import_url, :string
    field :name, :string
    field :remote_id, :string
    field :remote_name, :string
    field :url, :string
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:email, :id, :import_url, :name, :remote_id, :remote_name, :url, :__info__, :__joins__])
    
  end
end
