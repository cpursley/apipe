defmodule GitHubOpenAPI.ContentTree do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :_links, :map
    field :content, :string
    field :download_url, :string
    field :entries, {:array, :string}
    field :git_url, :string
    field :html_url, :string
    field :name, :string
    field :path, :string
    field :sha, :string
    field :size, :integer
    field :type, :string
    field :url, :string
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:content, :download_url, :entries, :git_url, :html_url, :name, :path, :sha, :size, :type, :url, :__info__, :__joins__])
    
  end
end
