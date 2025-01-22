defmodule GitHubOpenAPI.CustomPropertySetPayload do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :allowed_values, {:array, :string}
    field :default_value, :map
    field :description, :string
    field :required, :boolean
    field :value_type, Ecto.Enum, values: [:string, :single_select, :multi_select, :true_false]
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:allowed_values, :default_value, :description, :required, :value_type, :__info__, :__joins__])
    
  end
end
