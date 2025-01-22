defmodule GitHubOpenAPI.InstallationToken do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :expires_at, :string
    field :has_multiple_single_files, :boolean
    field :repository_selection, Ecto.Enum, values: [:all, :selected]
    field :single_file, :string
    field :single_file_paths, {:array, :string}
    field :token, :string
    embeds_one :permissions, GitHubOpenAPI.AppPermissions
    embeds_many :repositories, GitHubOpenAPI.Repository
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:expires_at, :has_multiple_single_files, :repository_selection, :single_file, :single_file_paths, :token, :__info__, :__joins__])
        |> cast_embed(:permissions, with: &GitHubOpenAPI.AppPermissions.changeset/2)
    |> cast_embed(:repositories, with: &GitHubOpenAPI.Repository.changeset/2)
  end
end
