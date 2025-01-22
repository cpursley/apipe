defmodule GitHubOpenAPI.StatusCheckPolicy do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :checks, {:array, :string}
    field :contexts, {:array, :string}
    field :contexts_url, :string
    field :strict, :boolean
    field :url, :string
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:checks, :contexts, :contexts_url, :strict, :url, :__info__, :__joins__])
    
  end
end
