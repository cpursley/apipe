defmodule GitHubOpenAPI.SimpleClassroomUser do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :avatar_url, :string
    field :html_url, :string
    field :id, :integer
    field :login, :string
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:avatar_url, :html_url, :id, :login, :__info__, :__joins__])
    
  end
end
