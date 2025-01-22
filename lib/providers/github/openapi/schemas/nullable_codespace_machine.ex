defmodule GitHubOpenAPI.NullableCodespaceMachine do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :cpus, :integer
    field :display_name, :string
    field :memory_in_bytes, :integer
    field :name, :string
    field :operating_system, :string
    field :prebuild_availability, Ecto.Enum, values: [:none, :ready, :in_progress]
    field :storage_in_bytes, :integer
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:cpus, :display_name, :memory_in_bytes, :name, :operating_system, :prebuild_availability, :storage_in_bytes, :__info__, :__joins__])
    
  end
end
