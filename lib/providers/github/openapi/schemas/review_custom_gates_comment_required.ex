defmodule GitHubOpenAPI.ReviewCustomGatesCommentRequired do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :comment, :string
    field :environment_name, :string
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:comment, :environment_name, :__info__, :__joins__])
    
  end
end
