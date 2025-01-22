defmodule GitHubOpenAPI.WebhooksWorkflowJobRun do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :conclusion, :map
    field :created_at, :string
    field :environment, :string
    field :html_url, :string
    field :id, :integer
    field :name, :map
    field :status, :string
    field :updated_at, :string
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:conclusion, :created_at, :environment, :html_url, :id, :name, :status, :updated_at, :__info__, :__joins__])
    
  end
end
