defmodule GitHubOpenAPI.RepositoryRuleset do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :_links, :map
    field :conditions, :map
    field :created_at, :string
    field :current_user_can_bypass, Ecto.Enum, values: [:always, :pull_requests_only, :never]
    field :id, :integer
    field :name, :string
    field :node_id, :string
    field :source, :string
    field :source_type, Ecto.Enum, values: [:"Repository", :"Organization", :"Enterprise"]
    field :target, Ecto.Enum, values: [:branch, :tag, :push, :repository]
    field :updated_at, :string
    embeds_many :bypass_actors, GitHubOpenAPI.RepositoryRulesetBypassActor
    embeds_one :enforcement, GitHubOpenAPI.RepositoryRuleEnforcement
    embeds_many :rules, GitHubOpenAPI.RepositoryRule
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:conditions, :created_at, :current_user_can_bypass, :id, :name, :node_id, :source, :source_type, :target, :updated_at, :__info__, :__joins__])
        |> cast_embed(:bypass_actors, with: &GitHubOpenAPI.RepositoryRulesetBypassActor.changeset/2)
    |> cast_embed(:enforcement, with: &GitHubOpenAPI.RepositoryRuleEnforcement.changeset/2)
    |> cast_embed(:rules, with: &GitHubOpenAPI.RepositoryRule.changeset/2)
  end
end
