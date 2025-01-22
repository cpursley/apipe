defmodule GitHubOpenAPI.ContentSymlink do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :_links, :map
    field :download_url, :string
    field :git_url, :string
    field :html_url, :string
    field :name, :string
    field :path, :string
    field :sha, :string
    field :size, :integer
    field :target, :string
    field :type, Ecto.Enum, values: [:symlink]
    field :url, :string
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:download_url, :git_url, :html_url, :name, :path, :sha, :size, :target, :type, :url, :__info__, :__joins__])
    
  end
end
