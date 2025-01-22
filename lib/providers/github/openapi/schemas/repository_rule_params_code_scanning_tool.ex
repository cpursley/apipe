defmodule GitHubOpenAPI.RepositoryRuleParamsCodeScanningTool do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :alerts_threshold, Ecto.Enum, values: [:none, :errors, :errors_and_warnings, :all]
    field :security_alerts_threshold, Ecto.Enum, values: [:none, :critical, :high_or_higher, :medium_or_higher, :all]
    field :tool, :string
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:alerts_threshold, :security_alerts_threshold, :tool, :__info__, :__joins__])
    
  end
end
