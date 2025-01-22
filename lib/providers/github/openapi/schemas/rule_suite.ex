defmodule GitHubOpenAPI.RuleSuite do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :actor_id, :integer
    field :actor_name, :string
    field :after_sha, :string
    field :before_sha, :string
    field :evaluation_result, Ecto.Enum, values: [:pass, :fail, :bypass]
    field :id, :integer
    field :pushed_at, :string
    field :ref, :string
    field :repository_id, :integer
    field :repository_name, :string
    field :result, Ecto.Enum, values: [:pass, :fail, :bypass]
    field :rule_evaluations, {:array, :string}
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:actor_id, :actor_name, :after_sha, :before_sha, :evaluation_result, :id, :pushed_at, :ref, :repository_id, :repository_name, :result, :rule_evaluations, :__info__, :__joins__])
    
  end
end
