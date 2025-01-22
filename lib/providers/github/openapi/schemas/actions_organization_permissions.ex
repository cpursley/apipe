defmodule GitHubOpenAPI.ActionsOrganizationPermissions do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :selected_repositories_url, :string
    embeds_one :allowed_actions, GitHubOpenAPI.AllowedActions
    embeds_one :enabled_repositories, GitHubOpenAPI.EnabledRepositories
    embeds_one :selected_actions_url, GitHubOpenAPI.SelectedActionsUrl
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:selected_repositories_url, :__info__, :__joins__])
        |> cast_embed(:allowed_actions, with: &GitHubOpenAPI.AllowedActions.changeset/2)
    |> cast_embed(:enabled_repositories, with: &GitHubOpenAPI.EnabledRepositories.changeset/2)
    |> cast_embed(:selected_actions_url, with: &GitHubOpenAPI.SelectedActionsUrl.changeset/2)
  end
end
