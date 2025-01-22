defmodule GitHubOpenAPI.ActionsHostedRunner do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :id, :integer
    field :last_active_on, :string
    field :maximum_runners, :integer
    field :name, :string
    field :platform, :string
    field :public_ip_enabled, :boolean
    field :runner_group_id, :integer
    field :status, Ecto.Enum, values: [:"Ready", :"Provisioning", :"Shutdown", :"Deleting", :"Stuck"]
    embeds_one :image_details, GitHubOpenAPI.NullableActionsHostedRunnerPoolImage
    embeds_one :machine_size_details, GitHubOpenAPI.ActionsHostedRunnerMachineSpec
    embeds_many :public_ips, GitHubOpenAPI.PublicIp
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:id, :last_active_on, :maximum_runners, :name, :platform, :public_ip_enabled, :runner_group_id, :status, :__info__, :__joins__])
        |> cast_embed(:image_details, with: &GitHubOpenAPI.NullableActionsHostedRunnerPoolImage.changeset/2)
    |> cast_embed(:machine_size_details, with: &GitHubOpenAPI.ActionsHostedRunnerMachineSpec.changeset/2)
    |> cast_embed(:public_ips, with: &GitHubOpenAPI.PublicIp.changeset/2)
  end
end
