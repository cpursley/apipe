defmodule GitHubOpenAPI.NetworkConfiguration do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :compute_service, Ecto.Enum, values: [:none, :actions, :codespaces]
    field :created_on, :string
    field :id, :string
    field :name, :string
    field :network_settings_ids, {:array, :string}
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:compute_service, :created_on, :id, :name, :network_settings_ids, :__info__, :__joins__])
    
  end
end
