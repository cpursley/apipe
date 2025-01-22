defmodule GitHubOpenAPI.PullRequestMinimal do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :base, :map
    field :head, :map
    field :id, :integer
    field :number, :integer
    field :url, :string
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:id, :number, :url, :__info__, :__joins__])
    
  end
end
