defmodule GitHubOpenAPI.CodeScanningDefaultSetup do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :languages, {:array, :string}
    field :query_suite, Ecto.Enum, values: [:default, :extended]
    field :runner_label, :string
    field :runner_type, Ecto.Enum, values: [:standard, :labeled]
    field :schedule, Ecto.Enum, values: [:weekly]
    field :state, Ecto.Enum, values: [:configured, :"not-configured"]
    field :updated_at, :string
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:languages, :query_suite, :runner_label, :runner_type, :schedule, :state, :updated_at, :__info__, :__joins__])
    
  end
end
