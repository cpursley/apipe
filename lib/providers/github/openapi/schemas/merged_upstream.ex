defmodule GitHubOpenAPI.MergedUpstream do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :base_branch, :string
    field :merge_type, Ecto.Enum, values: [:merge, :"fast-forward", :none]
    field :message, :string
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:base_branch, :merge_type, :message, :__info__, :__joins__])
    
  end
end
