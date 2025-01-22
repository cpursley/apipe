defmodule GitHubOpenAPI.LicenseContent do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :_links, :map
    field :content, :string
    field :download_url, :string
    field :encoding, :string
    field :git_url, :string
    field :html_url, :string
    field :name, :string
    field :path, :string
    field :sha, :string
    field :size, :integer
    field :type, :string
    field :url, :string
    embeds_one :license, GitHubOpenAPI.NullableLicenseSimple
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:content, :download_url, :encoding, :git_url, :html_url, :name, :path, :sha, :size, :type, :url, :__info__, :__joins__])
        |> cast_embed(:license, with: &GitHubOpenAPI.NullableLicenseSimple.changeset/2)
  end
end
