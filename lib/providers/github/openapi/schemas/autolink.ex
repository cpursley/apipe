defmodule GitHubOpenAPI.Autolink do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :id, :integer
    field :is_alphanumeric, :boolean
    field :key_prefix, :string
    field :url_template, :string
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:id, :is_alphanumeric, :key_prefix, :url_template, :__info__, :__joins__])
    
  end
end
