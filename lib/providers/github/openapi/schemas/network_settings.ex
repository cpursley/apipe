defmodule GitHubOpenAPI.NetworkSettings do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :id, :string
    field :name, :string
    field :network_configuration_id, :string
    field :region, :string
    field :subnet_id, :string
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:id, :name, :network_configuration_id, :region, :subnet_id, :__info__, :__joins__])
    
  end
end
