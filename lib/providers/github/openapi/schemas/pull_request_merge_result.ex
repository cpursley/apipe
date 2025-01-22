defmodule GitHubOpenAPI.PullRequestMergeResult do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :merged, :boolean
    field :message, :string
    field :sha, :string
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:merged, :message, :sha, :__info__, :__joins__])
    
  end
end
