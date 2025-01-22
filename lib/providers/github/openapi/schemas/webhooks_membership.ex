defmodule GitHubOpenAPI.WebhooksMembership do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :organization_url, :string
    field :role, :string
    field :state, :string
    field :url, :string
    field :user, :map
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:organization_url, :role, :state, :url, :__info__, :__joins__])
    
  end
end
