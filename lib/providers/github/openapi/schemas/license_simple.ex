defmodule GitHubOpenAPI.LicenseSimple do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :html_url, :string
    field :key, :string
    field :name, :string
    field :node_id, :string
    field :spdx_id, :string
    field :url, :string
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:html_url, :key, :name, :node_id, :spdx_id, :url, :__info__, :__joins__])
    
  end
end
