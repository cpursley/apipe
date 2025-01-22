defmodule GitHubOpenAPI.BranchRestrictionPolicy do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :apps, {:array, :string}
    field :apps_url, :string
    field :teams, {:array, :string}
    field :teams_url, :string
    field :url, :string
    field :users, {:array, :string}
    field :users_url, :string
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:apps, :apps_url, :teams, :teams_url, :url, :users, :users_url, :__info__, :__joins__])
    
  end
end
