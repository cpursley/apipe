defmodule GitHubOpenAPI.PageDeployment do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :id, :map
    field :page_url, :string
    field :preview_url, :string
    field :status_url, :string
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:id, :page_url, :preview_url, :status_url, :__info__, :__joins__])
    
  end
end
