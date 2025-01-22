defmodule GitHubOpenAPI.Milestone do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :closed_at, :string
    field :closed_issues, :integer
    field :created_at, :string
    field :description, :string
    field :due_on, :string
    field :html_url, :string
    field :id, :integer
    field :labels_url, :string
    field :node_id, :string
    field :number, :integer
    field :open_issues, :integer
    field :state, Ecto.Enum, values: [:open, :closed]
    field :title, :string
    field :updated_at, :string
    field :url, :string
    embeds_one :creator, GitHubOpenAPI.NullableSimpleUser
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:closed_at, :closed_issues, :created_at, :description, :due_on, :html_url, :id, :labels_url, :node_id, :number, :open_issues, :state, :title, :updated_at, :url, :__info__, :__joins__])
        |> cast_embed(:creator, with: &GitHubOpenAPI.NullableSimpleUser.changeset/2)
  end
end
