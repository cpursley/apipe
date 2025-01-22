defmodule GitHubOpenAPI.RunnerGroupsOrg do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :allows_public_repositories, :boolean
    field :default, :boolean
    field :hosted_runners_url, :string
    field :id, :float
    field :inherited, :boolean
    field :inherited_allows_public_repositories, :boolean
    field :name, :string
    field :network_configuration_id, :string
    field :restricted_to_workflows, :boolean
    field :runners_url, :string
    field :selected_repositories_url, :string
    field :selected_workflows, {:array, :string}
    field :visibility, :string
    field :workflow_restrictions_read_only, :boolean
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:allows_public_repositories, :default, :hosted_runners_url, :id, :inherited, :inherited_allows_public_repositories, :name, :network_configuration_id, :restricted_to_workflows, :runners_url, :selected_repositories_url, :selected_workflows, :visibility, :workflow_restrictions_read_only, :__info__, :__joins__])
    
  end
end
