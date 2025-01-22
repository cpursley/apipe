defmodule GitHubOpenAPI.GistHistory do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :change_status, :map
    field :committed_at, :string
    field :url, :string
    field :version, :string
    embeds_one :user, GitHubOpenAPI.NullableSimpleUser
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:committed_at, :url, :version, :__info__, :__joins__])
        |> cast_embed(:user, with: &GitHubOpenAPI.NullableSimpleUser.changeset/2)
  end
end
