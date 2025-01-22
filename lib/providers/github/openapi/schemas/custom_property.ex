defmodule GitHubOpenAPI.CustomProperty do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :allowed_values, {:array, :string}
    field :default_value, :map
    field :description, :string
    field :property_name, :string
    field :required, :boolean
    field :source_type, Ecto.Enum, values: [:organization, :enterprise]
    field :url, :string
    field :value_type, Ecto.Enum, values: [:string, :single_select, :multi_select, :true_false]
    field :values_editable_by, Ecto.Enum, values: [:org_actors, :org_and_repo_actors]
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:allowed_values, :default_value, :description, :property_name, :required, :source_type, :url, :value_type, :values_editable_by, :__info__, :__joins__])
    
  end
end
