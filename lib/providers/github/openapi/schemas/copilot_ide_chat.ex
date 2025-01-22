defmodule GitHubOpenAPI.CopilotIdeChat do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :editors, {:array, :string}
    field :total_engaged_users, :integer
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:editors, :total_engaged_users, :__info__, :__joins__])
    
  end
end
