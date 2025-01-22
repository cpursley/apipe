defmodule GitHubOpenAPI.NullableCommunityHealthFile do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :html_url, :string
    field :url, :string
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:html_url, :url, :__info__, :__joins__])
    
  end
end
