defmodule GitHubOpenAPI.ReactionRollup do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :"+1", :integer
    field :"-1", :integer
    field :confused, :integer
    field :eyes, :integer
    field :heart, :integer
    field :hooray, :integer
    field :laugh, :integer
    field :rocket, :integer
    field :total_count, :integer
    field :url, :string
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:"+1", :"-1", :confused, :eyes, :heart, :hooray, :laugh, :rocket, :total_count, :url, :__info__, :__joins__])
    
  end
end
