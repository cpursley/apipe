defmodule GitHubOpenAPI.SelectedActions do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :github_owned_allowed, :boolean
    field :patterns_allowed, {:array, :string}
    field :verified_allowed, :boolean
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:github_owned_allowed, :patterns_allowed, :verified_allowed, :__info__, :__joins__])
    
  end
end
