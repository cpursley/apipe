defmodule GitHubOpenAPI.AutoMerge do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :commit_message, :string
    field :commit_title, :string
    field :merge_method, Ecto.Enum, values: [:merge, :squash, :rebase]
    embeds_one :enabled_by, GitHubOpenAPI.SimpleUser
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:commit_message, :commit_title, :merge_method, :__info__, :__joins__])
        |> cast_embed(:enabled_by, with: &GitHubOpenAPI.SimpleUser.changeset/2)
  end
end
