defmodule GitHubOpenAPI.Activity do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :activity_type, Ecto.Enum, values: [:push, :force_push, :branch_deletion, :branch_creation, :pr_merge, :merge_queue_merge]
    field :after, :string
    field :before, :string
    field :id, :integer
    field :node_id, :string
    field :ref, :string
    field :timestamp, :string
    embeds_one :actor, GitHubOpenAPI.NullableSimpleUser
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:activity_type, :after, :before, :id, :node_id, :ref, :timestamp, :__info__, :__joins__])
        |> cast_embed(:actor, with: &GitHubOpenAPI.NullableSimpleUser.changeset/2)
  end
end
