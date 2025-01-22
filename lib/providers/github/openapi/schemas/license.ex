defmodule GitHubOpenAPI.License do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :body, :string
    field :conditions, {:array, :string}
    field :description, :string
    field :featured, :boolean
    field :html_url, :string
    field :implementation, :string
    field :key, :string
    field :limitations, {:array, :string}
    field :name, :string
    field :node_id, :string
    field :permissions, {:array, :string}
    field :spdx_id, :string
    field :url, :string
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:body, :conditions, :description, :featured, :html_url, :implementation, :key, :limitations, :name, :node_id, :permissions, :spdx_id, :url, :__info__, :__joins__])
    
  end
end
