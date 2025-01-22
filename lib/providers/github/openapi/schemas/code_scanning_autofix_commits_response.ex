defmodule GitHubOpenAPI.CodeScanningAutofixCommitsResponse do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :sha, :string
    field :target_ref, :string
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:sha, :target_ref, :__info__, :__joins__])
    
  end
end
