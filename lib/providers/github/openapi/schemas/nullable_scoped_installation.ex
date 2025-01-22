defmodule GitHubOpenAPI.NullableScopedInstallation do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :has_multiple_single_files, :boolean
    field :repositories_url, :string
    field :repository_selection, Ecto.Enum, values: [:all, :selected]
    field :single_file_name, :string
    field :single_file_paths, {:array, :string}
    embeds_one :account, GitHubOpenAPI.SimpleUser
    embeds_one :permissions, GitHubOpenAPI.AppPermissions
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:has_multiple_single_files, :repositories_url, :repository_selection, :single_file_name, :single_file_paths, :__info__, :__joins__])
        |> cast_embed(:account, with: &GitHubOpenAPI.SimpleUser.changeset/2)
    |> cast_embed(:permissions, with: &GitHubOpenAPI.AppPermissions.changeset/2)
  end
end
