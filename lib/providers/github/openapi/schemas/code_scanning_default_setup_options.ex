defmodule GitHubOpenAPI.CodeScanningDefaultSetupOptions do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :runner_label, :string
    field :runner_type, Ecto.Enum, values: [:standard, :labeled, :not_set]
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:runner_label, :runner_type, :__info__, :__joins__])
    
  end
end
