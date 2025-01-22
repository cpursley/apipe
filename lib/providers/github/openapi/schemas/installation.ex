defmodule GitHubOpenAPI.Installation do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :access_tokens_url, :string
    field :account, :map
    field :app_id, :integer
    field :app_slug, :string
    field :contact_email, :string
    field :created_at, :string
    field :events, {:array, :string}
    field :has_multiple_single_files, :boolean
    field :html_url, :string
    field :id, :integer
    field :repositories_url, :string
    field :repository_selection, Ecto.Enum, values: [:all, :selected]
    field :single_file_name, :string
    field :single_file_paths, {:array, :string}
    field :suspended_at, :string
    field :target_id, :integer
    field :target_type, :string
    field :updated_at, :string
    embeds_one :permissions, GitHubOpenAPI.AppPermissions
    embeds_one :suspended_by, GitHubOpenAPI.NullableSimpleUser
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:access_tokens_url, :account, :app_id, :app_slug, :contact_email, :created_at, :events, :has_multiple_single_files, :html_url, :id, :repositories_url, :repository_selection, :single_file_name, :single_file_paths, :suspended_at, :target_id, :target_type, :updated_at, :__info__, :__joins__])
        |> cast_embed(:permissions, with: &GitHubOpenAPI.AppPermissions.changeset/2)
    |> cast_embed(:suspended_by, with: &GitHubOpenAPI.NullableSimpleUser.changeset/2)
  end
end
