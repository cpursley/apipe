defmodule GitHubOpenAPI.GitTree do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :sha, :string
    field :tree, {:array, :string}
    field :truncated, :boolean
    field :url, :string
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:sha, :tree, :truncated, :url, :__info__, :__joins__])
    
  end
end
