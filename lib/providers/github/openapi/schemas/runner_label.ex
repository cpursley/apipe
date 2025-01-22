defmodule GitHubOpenAPI.RunnerLabel do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :id, :integer
    field :name, :string
    field :type, Ecto.Enum, values: [:"read-only", :custom]
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:id, :name, :type, :__info__, :__joins__])
    
  end
end
