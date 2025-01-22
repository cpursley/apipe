defmodule GitHubOpenAPI.WebhookProjectsV2StatusUpdateEdited do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :action, Ecto.Enum, values: [:edited]
    field :changes, :map
    embeds_one :installation, GitHubOpenAPI.SimpleInstallation
    embeds_one :organization, GitHubOpenAPI.OrganizationSimpleWebhooks
    embeds_one :projects_v2_status_update, GitHubOpenAPI.ProjectsV2StatusUpdate
    embeds_one :sender, GitHubOpenAPI.SimpleUser
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:action, :__info__, :__joins__])
        |> cast_embed(:installation, with: &GitHubOpenAPI.SimpleInstallation.changeset/2)
    |> cast_embed(:organization, with: &GitHubOpenAPI.OrganizationSimpleWebhooks.changeset/2)
    |> cast_embed(:projects_v2_status_update, with: &GitHubOpenAPI.ProjectsV2StatusUpdate.changeset/2)
    |> cast_embed(:sender, with: &GitHubOpenAPI.SimpleUser.changeset/2)
  end
end
