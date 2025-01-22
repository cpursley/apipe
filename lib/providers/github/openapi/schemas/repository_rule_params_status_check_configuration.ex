defmodule GitHubOpenAPI.RepositoryRuleParamsStatusCheckConfiguration do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :context, :string
    field :integration_id, :integer
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:context, :integration_id, :__info__, :__joins__])
    
  end
end
