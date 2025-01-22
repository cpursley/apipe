defmodule GitHubOpenAPI.ActionsHostedRunnerMachineSpec do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :cpu_cores, :integer
    field :id, :string
    field :memory_gb, :integer
    field :storage_gb, :integer
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:cpu_cores, :id, :memory_gb, :storage_gb, :__info__, :__joins__])
    
  end
end
