defmodule GitHubOpenAPI.WebhookSecretScanningScanCompleted do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :action, Ecto.Enum, values: [:completed]
    field :completed_at, :string
    field :custom_pattern_name, :string
    field :custom_pattern_scope, Ecto.Enum, values: [:repository, :organization, :enterprise]
    field :secret_types, {:array, :string}
    field :source, Ecto.Enum, values: [:git, :issues, :"pull-requests", :discussions, :wiki]
    field :started_at, :string
    field :type, Ecto.Enum, values: [:backfill, :"custom-pattern-backfill", :"pattern-version-backfill"]
    embeds_one :enterprise, GitHubOpenAPI.EnterpriseWebhooks
    embeds_one :installation, GitHubOpenAPI.SimpleInstallation
    embeds_one :organization, GitHubOpenAPI.OrganizationSimpleWebhooks
    embeds_one :repository, GitHubOpenAPI.RepositoryWebhooks
    embeds_one :sender, GitHubOpenAPI.SimpleUser
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:action, :completed_at, :custom_pattern_name, :custom_pattern_scope, :secret_types, :source, :started_at, :type, :__info__, :__joins__])
        |> cast_embed(:enterprise, with: &GitHubOpenAPI.EnterpriseWebhooks.changeset/2)
    |> cast_embed(:installation, with: &GitHubOpenAPI.SimpleInstallation.changeset/2)
    |> cast_embed(:organization, with: &GitHubOpenAPI.OrganizationSimpleWebhooks.changeset/2)
    |> cast_embed(:repository, with: &GitHubOpenAPI.RepositoryWebhooks.changeset/2)
    |> cast_embed(:sender, with: &GitHubOpenAPI.SimpleUser.changeset/2)
  end
end
