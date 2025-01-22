defmodule GitHubOpenAPI.Environment do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :created_at, :string
    field :html_url, :string
    field :id, :integer
    field :name, :string
    field :node_id, :string
    field :protection_rules, {:array, :string}
    field :updated_at, :string
    field :url, :string
    embeds_one :deployment_branch_policy, GitHubOpenAPI.DeploymentBranchPolicySettings
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:created_at, :html_url, :id, :name, :node_id, :protection_rules, :updated_at, :url, :__info__, :__joins__])
        |> cast_embed(:deployment_branch_policy, with: &GitHubOpenAPI.DeploymentBranchPolicySettings.changeset/2)
  end
end
