defmodule GitHubOpenAPI.CvssSeverities do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :cvss_v3, :map
    field :cvss_v4, :map
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:__info__, :__joins__])
    
  end
end
