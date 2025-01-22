defmodule GitHubOpenAPI.CodeScanningDefaultSetupUpdate do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :languages, {:array, :string}
    field :query_suite, Ecto.Enum, values: [:default, :extended]
    field :runner_label, :string
    field :runner_type, Ecto.Enum, values: [:standard, :labeled]
    field :state, Ecto.Enum, values: [:configured, :"not-configured"]
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:languages, :query_suite, :runner_label, :runner_type, :state, :__info__, :__joins__])
    
  end
end
