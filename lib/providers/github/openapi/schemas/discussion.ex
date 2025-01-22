defmodule GitHubOpenAPI.Discussion do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :active_lock_reason, :string
    field :answer_chosen_at, :string
    field :answer_chosen_by, :map
    field :answer_html_url, :string
    field :author_association, Ecto.Enum, values: [:"COLLABORATOR", :"CONTRIBUTOR", :"FIRST_TIMER", :"FIRST_TIME_CONTRIBUTOR", :"MANNEQUIN", :"MEMBER", :"NONE", :"OWNER"]
    field :body, :string
    field :category, :map
    field :comments, :integer
    field :created_at, :string
    field :html_url, :string
    field :id, :integer
    field :locked, :boolean
    field :node_id, :string
    field :number, :integer
    field :reactions, :map
    field :repository_url, :string
    field :state, Ecto.Enum, values: [:open, :closed, :locked, :converting, :transferring]
    field :state_reason, Ecto.Enum, values: [:resolved, :outdated, :duplicate, :reopened]
    field :timeline_url, :string
    field :title, :string
    field :updated_at, :string
    field :user, :map
    embeds_many :labels, GitHubOpenAPI.Label
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:active_lock_reason, :answer_chosen_at, :answer_html_url, :author_association, :body, :comments, :created_at, :html_url, :id, :locked, :node_id, :number, :repository_url, :state, :state_reason, :timeline_url, :title, :updated_at, :__info__, :__joins__])
        |> cast_embed(:labels, with: &GitHubOpenAPI.Label.changeset/2)
  end
end
