defmodule GitHubOpenAPI.PageBuild do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :commit, :string
    field :created_at, :string
    field :duration, :integer
    field :error, :map
    field :status, :string
    field :updated_at, :string
    field :url, :string
    embeds_one :pusher, GitHubOpenAPI.NullableSimpleUser
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:commit, :created_at, :duration, :status, :updated_at, :url, :__info__, :__joins__])
        |> cast_embed(:pusher, with: &GitHubOpenAPI.NullableSimpleUser.changeset/2)
  end
end
