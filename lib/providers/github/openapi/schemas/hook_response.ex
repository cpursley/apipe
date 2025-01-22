defmodule GitHubOpenAPI.HookResponse do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :code, :integer
    field :message, :string
    field :status, :string
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:code, :message, :status, :__info__, :__joins__])
    
  end
end
