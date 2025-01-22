defmodule GitHubOpenAPI.Actor do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :avatar_url, :string
    field :display_login, :string
    field :gravatar_id, :string
    field :id, :integer
    field :login, :string
    field :url, :string
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:avatar_url, :display_login, :gravatar_id, :id, :login, :url, :__info__, :__joins__])
    
  end
end
