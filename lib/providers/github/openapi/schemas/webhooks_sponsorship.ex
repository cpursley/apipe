defmodule GitHubOpenAPI.WebhooksSponsorship do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :created_at, :string
    field :maintainer, :map
    field :node_id, :string
    field :privacy_level, :string
    field :sponsor, :map
    field :sponsorable, :map
    field :tier, :map
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:created_at, :node_id, :privacy_level, :__info__, :__joins__])
    
  end
end
