defmodule GitHubOpenAPI.CodeSecurityConfiguration do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :advanced_security, Ecto.Enum, values: [:enabled, :disabled]
    field :code_scanning_default_setup, Ecto.Enum, values: [:enabled, :disabled, :not_set]
    field :code_scanning_default_setup_options, :map
    field :created_at, :string
    field :dependabot_alerts, Ecto.Enum, values: [:enabled, :disabled, :not_set]
    field :dependabot_security_updates, Ecto.Enum, values: [:enabled, :disabled, :not_set]
    field :dependency_graph, Ecto.Enum, values: [:enabled, :disabled, :not_set]
    field :dependency_graph_autosubmit_action, Ecto.Enum, values: [:enabled, :disabled, :not_set]
    field :dependency_graph_autosubmit_action_options, :map
    field :description, :string
    field :enforcement, Ecto.Enum, values: [:enforced, :unenforced]
    field :html_url, :string
    field :id, :integer
    field :name, :string
    field :private_vulnerability_reporting, Ecto.Enum, values: [:enabled, :disabled, :not_set]
    field :secret_scanning, Ecto.Enum, values: [:enabled, :disabled, :not_set]
    field :secret_scanning_delegated_bypass, Ecto.Enum, values: [:enabled, :disabled, :not_set]
    field :secret_scanning_delegated_bypass_options, :map
    field :secret_scanning_non_provider_patterns, Ecto.Enum, values: [:enabled, :disabled, :not_set]
    field :secret_scanning_push_protection, Ecto.Enum, values: [:enabled, :disabled, :not_set]
    field :secret_scanning_validity_checks, Ecto.Enum, values: [:enabled, :disabled, :not_set]
    field :target_type, Ecto.Enum, values: [:global, :organization, :enterprise]
    field :updated_at, :string
    field :url, :string
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:advanced_security, :code_scanning_default_setup, :created_at, :dependabot_alerts, :dependabot_security_updates, :dependency_graph, :dependency_graph_autosubmit_action, :description, :enforcement, :html_url, :id, :name, :private_vulnerability_reporting, :secret_scanning, :secret_scanning_delegated_bypass, :secret_scanning_non_provider_patterns, :secret_scanning_push_protection, :secret_scanning_validity_checks, :target_type, :updated_at, :url, :__info__, :__joins__])
    
  end
end
