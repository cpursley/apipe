defmodule GitHubOpenAPI.PublicIp do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :enabled, :boolean
    field :length, :integer
    field :prefix, :string
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:enabled, :length, :prefix, :__info__, :__joins__])
    
  end
end
