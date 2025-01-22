defmodule GitHubOpenAPI.RepositoryRuleViolationError do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :documentation_url, :string
    field :message, :string
    field :metadata, :map
    field :status, :string
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:documentation_url, :message, :status, :__info__, :__joins__])
    
  end
end
