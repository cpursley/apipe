defmodule GitHubOpenAPI.CopilotDotcomPullRequests do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :repositories, {:array, :string}
    field :total_engaged_users, :integer
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:repositories, :total_engaged_users, :__info__, :__joins__])
    
  end
end
